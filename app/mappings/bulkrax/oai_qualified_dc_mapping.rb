module Bulkrax
  class OaiQualifiedDcMapping < ApplicationMapping
    def self.matcher_class
      Bulkrax::OaiMatcher
    end

    matcher 'alternative_title', from: ['alternative', 'alternative_title'], split: true
    matcher 'collections', from: ['isPartOf'], parsed: true
    matcher 'contributor', split: true
    matcher 'creator', split: true
    matcher 'date', from: ['date', 'created'], split: true
    matcher 'description'
    matcher 'extent'
    matcher 'format_digital', from: ['format_digital', 'format'], parsed: true
    matcher 'format_original', from: ['medium']
    matcher 'identifier', from: ['identifier'], if: ->(parser, content) { content.match(/http(s{0,1}):\/\//) }
    matcher 'language', parsed: true, split: true
    matcher 'manifest_url', from: ['hasFormat']
    matcher 'place', from: ['coverage', 'spatial']
    matcher 'publisher', split: /\s*[;]\s*/
    # NOTE (dewey4iv): Commented out per Rob. Being removed temporarily for ATLA's use
    # matcher 'relation', split: true
    matcher 'remote_files', from: ['thumbnail_url', 'hasVersion'], parsed: true
    matcher 'rights_holder', from: ['rights_holder', 'rightsHolder']
    matcher 'rights_statement', from: ['rights']
    matcher 'subject', split: true
    matcher 'time_period', from: ['time_period', 'temporal'], split: true
    matcher 'title'
    matcher 'types', from: ['types', 'type'], split: true, parsed: true
  end
end

#isPartOf
#hasFormat