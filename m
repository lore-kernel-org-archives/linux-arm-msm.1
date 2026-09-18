Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE063EB102
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 17:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753802; cv=none; b=byoRQkF6+TtKJzhwe+o4zWtv0MczLuvIiXXR0qYBNm1LdxIAuQbMf4C2xfEemHq5bWbgban+PazElAT3wLp3FNEyT6dIs9rR+olsG+z+opOsRD/hR2+xbYnocwp0+JfGuGnxRdmauEgEgNyH2ec72Y0ABM8UGFUNH2FqLLNze1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753802; c=relaxed/simple;
	bh=afPlTpVBOVxRusNWGxKuDYVFIlS9SkvZcarrTJS78lU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJCKnPcrq1Z90VA7Bciab0hmMMhfAs1Ca+2L0Wo2bqExQAqfnlQnRLHW/L8k1++zwIRIQK8La0Ys1LDbnXhsisU8cxa+2vXIhpGCcfcw9N49fB8e/QYaNMaAd8ekcQiSeTbuMBNly6bylkKaYYbL6vyY5lrTnV5FU/RzZ6g9ot4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=pVHEJOwK; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="pVHEJOwK"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-5329fc7e0bcso11717391cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789753795; x=1790358595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QBXBlps+fzGob8XyzdrqGGeZGJ/AtzGPAtCevAfGf40=;
        b=pVHEJOwKKdHLMeJuk4L8dL8tZ6DcYhRBL5eQdj3UfUKw4ms5RN1YlVphH0RTWYxbo8
         0dD9ZMsseW2hM7CXiM9mld2iUGabg7YU8cIfsrr4qUpT8GSld5V15b4+9z7Si4oDz+X6
         HkDti8jIAE8b6wkPrMuliLmC5JTEdLBJBHdhpBvhp7TieAuzxtMfAM/WOJNfuDYrNmSm
         TioyH2QXDpMo7UAJLntVwrqL8UVSPj2z2KcgN3RvBtVXB1kjfv6Aurfz08wOOCkj2snB
         zHU7ekFl8DBJB2+vSOD4clFjWjaRrqCKInFU+Nv29l3co1e5ZP0SXwBl71kfo1BTtyEp
         DfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753795; x=1790358595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QBXBlps+fzGob8XyzdrqGGeZGJ/AtzGPAtCevAfGf40=;
        b=c2+4Kh+Q8gWI/2TAgD/IuIyL/9d8TFXvVu04X46LD6EHpatKuOvnz9Xu+WH2Web32p
         vCdmo9jagaoTWnXRYi3xA0tFA+H1UEBv2U+UqQGVRtPIBBodw1e68ZVtiSxNl7z4Emby
         JalvlfJVPpgxiqU5HsSGPddb9jFoKf9LPcH5cXCueSIZnGm8ETeUiWTV5ZOi9haI7MC9
         VkEFKVzDzgDJBq2N55TU5WGjaS2ninFBHkXOPBs4DYP+o6FmcGGxo53NM3gB4e/hl3wB
         A2XWG2Z5vm6V1SFSpwkUreN/BrjPJovMgoQuvYV2YlCmHQIu8W/DwBfnbSk4sRAZehbw
         DdIA==
X-Forwarded-Encrypted: i=1; AKwUvBznIUQIpZA9U/OS6WZ6Pk9xWdyV5buwq9qLHico5TyS4oI+s2XMFL15af5rEeHNiAdKyzfBlJU+M2xgXOxF@vger.kernel.org
X-Gm-Message-State: AFuF++kLJgF4Q5fAWvJP0JiK5SRjUwLoWAgEOtQcUT65g0uBc4sIBbDt
	85pI9nMHFSJAbfhUoV8vC3U/opNJv9FTSxQ5EH2KsPFayHUsL/GwILU/j2ai02nElcg=
X-Gm-Gg: AYBFou2r+orSXqwqT7qLKpOFOWnAdQ87t2P5yDl7XGL5w0M5wo0DUrdTFUJlAp9LFgj
	1vJWC3aFZqSnP+rkxMKLuj6rXMkUqFy4lMlfSOAzLtkpa6U0FT8mqQsNQppEr5VAbt3fKG2B11p
	8mqJclfE+mNM+G6vGOLRAaE6C+GGHabM2gWLimNsULI/GMI3oGU3VDPGWd7GrUeynKv3JgtHIAo
	k+kaLPK1wmTpCjq9m89XGFaIzf9TF0ACfY2oJn8iWxnxjnfpoiYrjYdGQWtRAX+UwDdd+CdrsyU
	o3/buFieYIaMbsM4lyNn+ZMjJi8WG+cqHauUnH7HyfxOBp9d7fxqDdNUySWpKk27PYU0ty3JCJN
	YscktNUQb+MPU0T6WNqYHcAEFHW82vHOqp+1R/9XIkhSgsMB6xYPmGhDkTj0N+LIXsdXfgIC41M
	qLU3AB/9VFfrZ6dvdxJK8qlSzVCSU9vI+OR/KkSJEekEyOZLvR2R7cWwm/3uX839gyYyalJ+k=
X-Received: by 2002:ac8:5d8f:0:b0:530:ff84:e426 with SMTP id d75a77b69052e-5329e47ff4bmr57576891cf.47.1789753795392;
        Fri, 18 Sep 2026 10:49:55 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae5ef242sm2551661cf.5.2026.09.18.10.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 10:49:55 -0700 (PDT)
Message-ID: <e9bd7954-1cec-4ffb-a5b2-2389469b0c05@riscstar.com>
Date: Fri, 18 Sep 2026 12:49:53 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] misc: tc9564: introduce base PCI driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, bhelgaas@google.com, andersson@kernel.org,
 konradybcio@kernel.org, abelvesa@kernel.org, daniel@riscstar.com,
 mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrea della Porta <andrea.porta@suse.com>,
 Herve Codina <herve.codina@bootlin.com>, Lizhi Hou <lizhi.hou@amd.com>
References: <20260918173003.GA1166280@bhelgaas>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260918173003.GA1166280@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 12:30 PM, Bjorn Helgaas wrote:
> [+cc Andrea, Herve, Lizhi for of_pci_make_dev_node() quirks]
> 
> On Fri, Sep 18, 2026 at 10:26:57AM -0500, Alex Elder wrote:
>> The Toshiba TC9564 is small and highly-specialized SoC that implements
>> a PCIe switch as well as an Ethernet AVB/TSN bridge.  In addition to
>> these, the SoC implements other functions, including a reset and clock
>> controller, an address translation unit, and a few other devices.  PCIe
>> BARs provide access to registers that manage these IP blocks, and the
>> SoC is modeled using a PCI endpoint bus in devicetree.  This allows the
>> IP blocks to be bound to platform drivers that do MMIO via the PCI BARs.
>>
>> Create a new PCI driver under drivers/misc that binds with the embedded
>> PCI endpoint functions within the TC9564 SoC.  Because these functions
>> will use devicetree pci-ep-bus to provide access to other IP blocks
>> within the TC9564 chip, the main purpose of this driver is to do basic
>> PCI initialization, then call of_platform_default_populate() to scan for
>> the any endpoint bus children, and probe all devices defined therein.
>>
>> Because we're using pci-ep-bus, we need to use the PCI quirks mechanism
>> to have of_pci_make_dev_node() be called for each endpoint device in
>> pci_bus_add_device() (via pci_fixup_device(pci_fixup_final, dev)).
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>	# quirks.c
> 
> Not an issue for this patch, but I'm not sure the quirk mechanism is
> the best mechanism for doing this.  It's not working around a device
> defect like most quirks do.

I pretty much agree with you.  I think I mentioned this before
(though it might have been in a private conversation) that it
is an intentional act to call of_pci_make_dev_node() for an
endpoint (and not just a bridge).  And that's different from
a hardware quirk.  You only need to do it if there's a pci-ep-bus
sub-node on the endpoint.  (I'd have to verify this on the other
users of this approach to be 100% sure though.)

> I wonder if pci_bus_add_device() should unconditionally call a wrapper
> that calls of_pci_make_dev_node() for bridges and any device that
> appears in an allow-list.  I guess it sort of amounts to the same
> thing in the end, but it might be a little more explicit and not
> subject to CONFIG_PCI_QUIRKS.

Yes, I think it would be better to separate this case from PCI
quirks, which are really intended for anomalous hardware behavior.

I'd like to get these things merged, but would be willing to work
on this sort of thing (and/or on separating this driver type, as
Arnd suggested elsewhere).

Thanks a lot Bjorn.

					-Alex

>> +++ b/drivers/pci/quirks.c
>> @@ -6391,6 +6391,7 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_XILINX, 0x5020, of_pci_make_dev_node);
>>   DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_XILINX, 0x5021, of_pci_make_dev_node);
>>   DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_REDHAT, 0x0005, of_pci_make_dev_node);
>>   DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_EFAR, 0x9660, of_pci_make_dev_node);
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_TOSHIBA, 0x0220, of_pci_make_dev_node);
>>   
>>   /*
>>    * Devices known to require a longer delay before first config space access
>> -- 
>> 2.53.0
>>

