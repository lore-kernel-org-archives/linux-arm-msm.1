Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493201;
	b=GrVjPd3P+X4wcaHpTa3MDFjHdW8Lyjeuky6SsMDJbQulZM/YKK6TPPT4/pXFZfTxcwgE
	 VYmRZVJdyQdN9i1tnko5L2q9amukY4woelyZ1y9YtW+St9cR7+Etwf1/CCP4XjMeRgbwS
	 kXEFY7M2uI1yP0OB+XTWU4hx0Biay4EWC9s8Z9u7ZEOriMYDXPvLK7mTuVj0I4R8b4cGa
	 nwOFBi5Vec2Jad8JExeErkI0z7OI17p8JQSn1Wu69dX3ewQ95wZrsGemkC+i3V07vVbjR
	 +oxkRHeUm9tDNjrxRMY7gn+XsH5SlLaEHOOxa5aT6gttnowwdEYN/2xAMRqBZOFsVdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ycPyXlQxqPcynh4hgD5HOBjhMwhv2JiLkDDxXjwNZ6g=;
	b=Nz/1eZFFBPTRHuL09T8T1034hz/0a7+KP+7+N+qqeAoZS1gCyRZHpSSd6Jj4U4MkVB82
	 v/POF0igZc+uaN2DgmpIw/Wst3Awc1tARFHBbMGTYMrWLtWtasNc2mTTxj44fI594uofO
	 vqgo+Bn7w8eeAwyIPxpgUSLSHSV4XcqxYCQ+CPB4zOG3vHYNwDsFtsN0Gd35TNNvSdgAm
	 qD8tGict7LLj3+Go0WHL1LgNGdIFs3V9e4cIKDiFq4uyVy/e18WjnFTGUpYEoZVuocdkP
	 txutWC8+Yi0zaHOGGQBNL/nkVhMsqtzGd5CxQE9o/POrlfAXAixaeTo8BV1+gkTOy5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kZgNCjDz;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA19C6072A1B
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 14:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA19C6072A1B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kZgNCjDz
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso30594105e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 06:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794493198; x=1795097998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycPyXlQxqPcynh4hgD5HOBjhMwhv2JiLkDDxXjwNZ6g=;
        b=kZgNCjDzv07bETMIK11cdb/uvBRZbV73giXfxQwMZzyTHK4wPxme+erks4m19S/IhN
         cUmGDySLN9pAi/hNBAG4/zkhGD15KaIcLH83YK69msdqB+KjIz+jo+dqRGEwxCIDN3pS
         wv+lj7+q2dNnDNKSmpIAEPa8JJXdj4rT3H++MAjNm7vHmNAJSolee2JBYg6uje1fgh3/
         gC0rFC1SA9Z/j8jTB7Hng0PNzah8keLDOdxWsDRKSNQKbs/2W57p8dv85B9/1IQYcPTO
         teZI/frS3AXhHwAbjhHeomPDiPCMxzOF/KhFhMSrSPzGC5hRSIM5DtL//P3tp4MCh9fF
         eU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794493198; x=1795097998;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycPyXlQxqPcynh4hgD5HOBjhMwhv2JiLkDDxXjwNZ6g=;
        b=vyb5hyRYPZ+WyUsz3fsBI/P69kVEoajKToNs366PGgeLDGaXhPT2qQbyTvz0uY0vmV
         b7XZd2Jw89yoVFs+moVhXhiFyyiPsCtTG7Js096WbMfb6qMrZ1+6bSAza+1S01Vmnuxg
         s+njzifdhLGTpYaws0QsfWVzP/UlH5JFzeY9fi4E/kvAHGyByPaCIUD60XyGW/AlJ0Mq
         rIIQwO/jEhSL0Oo8SONhUd3OdMAj8v8n4UTB4wY5CthmKVhvXIic4h+91GKNM7lg7dvL
         kvAplI+fdQZTJK6ylwLv5947SKsDCZL5MkqEikwns9En97S+xcYDwccSuxQWN4Zu4EhM
         hS0g==
X-Forwarded-Encrypted: i=1; AL+hErFlF/i09O+k/XxFLbW6eLhkknap6ojqU8T4a4YY7P58m8qaEveNTQLbS3QPeS+zLNKEARNWkn5r922d0i4x@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZRl3X5zpBShzqSSd190d2+z7FxJdEjIxxARpArlIrYHVagM8C
	BJ0uCgmAqTq6p7YHt/rO/d9tTYPaFu5jcCt4Q+YbOce8lX/gr6zMGYpW55FtEXYV53c=
X-Gm-Gg: AYBFou3VC2ozp4gsQOMwuzMeirDnm4dl5G8Bmej/QmUCG0FMEy6gmv2Fu5il/5UusPO
	urOhyjcQ8rk99ngI6afynMDrixTpob4nDqCcJSwciT30PVVFOtOcEq8j/Li5DPhADY6mL649Xbj
	Qqtlicxu1M65TURTXswuSV/1YHtX5NaqsL9gRRHL2XywKkXYiURToPfkXbnYkc+phb8tJDZymXq
	r7ftLy9YBxKzkBe5i9uz5nfEZf+r14nuDQYmNrHfZ+QlD7zenMMOkpdYS4B3WwUeiQe/zLdBha3
	DkelijA0wsv5tJKZAuAtH+M8va9XF31IK+zkcaSLbhTDJa//SDOLTOaKqGSR+Vx13M0yuAEQ4lb
	zC0KChCiuDUFtSukReVRfa/FSvvT/h4X57nbWP5a0U9UTUI4IGk+ngwSNGbF8MCqOfBY5ZfhbCS
	PisqsAhtmDwdJay/T6a1AdiadQHYnI3X+8ypQVVLA/T1TrZpk3FdedYlueRPYuf3jaPekhpHLsx
	JPmiUhYfQO03c6ijFvv7g4tUo0U499wefDxVp7xPbXCoXIOOvVOhr2UfzBYVowLn/0UAC7K3zY6
	vfxMEglX4g9UQdIKTE32hYrgRm/mGKO0p4tHKnc551A=
X-Received: by 2002:a05:600c:4f84:b0:4a3:59c2:b41e with SMTP id 5b1f17b1804b1-4ba0931ed6bmr104812575e9.4.1794493197930;
        Thu, 12 Nov 2026 06:19:57 -0800 (PST)
Received: from [192.168.0.167] ([109.78.26.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e29d24dsm75906065e9.11.2026.11.12.06.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:19:57 -0800 (PST)
Message-ID: <a35530a0-3a4e-4975-8335-94898aa9abaa@linaro.org>
Date: Thu, 12 Nov 2026 14:19:55 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] iommu/of: Require reg for iommu-addresses
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Vasant Hegde <vasant.hegde@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>,
 Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
 Eric Auger <eric.auger@redhat.com>, Joerg Roedel <jroedel@suse.de>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Oza Pawandeep <quic_poza@quicinc.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, devicetree@vger.kernel.org,
 kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-4-5c0f72083e52@oss.qualcomm.com>
 <3713bf13-cec6-4b02-a29b-8f76070f03b3@linaro.org>
 <97c4eabf-16b0-4e3f-8aab-1c56912c27d4@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <97c4eabf-16b0-4e3f-8aab-1c56912c27d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/11/2026 14:04, Vikash Garodia wrote:
> 
> On 11/11/2026 5:32 PM, Bryan O'Donoghue wrote:
>> On 06/11/2026 17:14, Vikash Garodia wrote:
>>> @@ -257,6 +252,9 @@ void of_iommu_get_resv_regions(struct device 
>>> *dev, struct list_head *list)
>>>                   }
>>>                   type = iommu_resv_region_get_type(dev, &phys, iova, 
>>> length);
>>> +                if (type != IOMMU_RESV_DIRECT)
>>> +                    continue;
>>> +
>>
>> This change is not about requiring a reg though, which is why it 
>> should be a standalone patch with its own justifications.
>>
> 
> This is about reg, which determines the direct mapping, hence the code 
> is very much applicable to this patch. Please refer this code [1]
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/ 
> tree/drivers/iommu/of_iommu.c#n223
But this change is not about requiring a reg. It's about not reserving 
when reg and IOVA don't match.

So reading a patch entitled "Require reg for iommu-addresses" doesn't 
actually transmit the information of what this second change does.

Which is why that change should have its own patch.

Require reg != don't reserve reg + non-matching IOVA.

A reasonable reviewer might ask "why is a mismatch dropped instead of 
reserved" - which is the question I ask myself as I read and IMO isn't 
answered - which is why I've asked for a patch which reasons that out.

It may be that conjoining iommu-addresses/reg and !reserving mismatch 
are in fact the same thing but I don't think that jumps out of the code 
as you read it and I doubt adding to this commit log would make it much 
clearer because it seems like two changes in one patch.

It would be something like "require a reg and don't reserve on mismatch"

The "and" part is the part I'm flagging as likely deserving its own 
patch which explains what/why but "require reg" ain't it.

---
bod
