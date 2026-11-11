Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398570;
	b=twpw1Fz9eR0nP59C4oPxq1O7ms9TQIZxHY4I56n5V+p6k50hWF4Qg7LWb8oA3a2UqTSi
	 xSbN3POrUraAHKzsmD+1H7hvmnrxzQs3k+Uozlo4MTQWUrfmdV1qChGg+fje4+gnRUJK/
	 +K88XHbGlwDDyvjY9BdJreyaLf96Awooux/Od+i0kf1Yz+BhuWM14bV/gzKXjSw0eaLbH
	 rwGLPFxTEXkqm3eQO0V9UH9X8UBNGH92FUI2QyaAWdilpwyL+C7R8A0yzxIpvKjJEEsAK
	 nC+AxGS5ucIv3f4iXerY0uSkSrlBzf3MVzM6RLYrOd/b0I2Tzz3yvVm5LbHSJrgm0sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Mf3ojcAaOl5Wd2bB/OvSpA9q4iDAVUFZx+UCDfwTy74=;
	b=yhBCFealzPxMlEKNz07pGs85v1qBcNMhQGYAvYlFKQj+m8/fQmtrHVcJYn+rNiVWaUpE
	 uOnzrzQndx7V0X0EXfYxJCJcXT9NG1yk6mYLFb6L414IHso8KFz4LbzESfxJjlQiT8/FL
	 Bfgg1Rm00GrHJs7NSI5rBF9u0zVyfq5jPk3K6FB+N/8RotUFq7Og9yldyaOHylccbqgKE
	 zPh79LISIRzUFhndzzsLvPW9zoxoKt2CnE+p+r5T7gQNiMu9eKiJQdZ527erH2R8vfAdc
	 4DLG3dOlEcStzNYCPs+v/Yok4cRnQUZuwRrpZoseasT6ZnQu8DgyHpBzPRyTPwJUJJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Je1CYIjf;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA894606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA894606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Je1CYIjf
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4922dbcee23so1781707f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794398568; x=1795003368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mf3ojcAaOl5Wd2bB/OvSpA9q4iDAVUFZx+UCDfwTy74=;
        b=Je1CYIjfuwflh3C8ZTO7fGiG3VT2JZ4/KZsAnIckMk5yyFTVUjMTyMSMVoowIwUALe
         rIx+YCcQd5d3c/Oo7ywHWhe+3KSTQ7o6rFpU0FKq7oz4uEO2xHVWkEcknh525ow1mgCu
         gWFknAYgozrE3xkB1Hf35d8etynb8NZA5amXxyEuDKuHJdX9BiOMQOk4XO6ih4oDz5ll
         jiNbUTntFWcfE3xAvdYsPO01gTShdzNlx4xruDnGGl89qAWG/eS5QeVSu9Tt1rrguObP
         WWiW9en2E3WuuFqlZwdLZQMuWBF1+OevnHMcH8EoqrsFJwJLse2YUIb6yJUacp0hHv8D
         xyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398568; x=1795003368;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mf3ojcAaOl5Wd2bB/OvSpA9q4iDAVUFZx+UCDfwTy74=;
        b=jn9gOD0yQ1wd0ARl3GYnSBMpyKgptJ7WxY2EQ28pK+ottwHU9PuSh0Pu0284lROH4C
         oaCzvVJ7oWexqr0goaJdBhsRfvrt0TejQl3qZsUwmlLQDxMLBhx8CO8FFW7SGs8s35fR
         IBOZZTNDflI2ruCSPclTngjphTXIGrM+vH6ArO5Nsb8Zlpy/qS81kZP84QfmF3KM9K5f
         NAKOZYTER54mVd+OEYqWC3so7iD3gXYPtbgPOAWvGwpACiav+aOotCseWoPhETFClLNr
         rLtuFRyPCYcXReaOfOC3ME4KNmpjTUnpDzVFd2pIhKxy7Ej/i8cuFBXn6zwxBQrC7pGf
         ed1w==
X-Forwarded-Encrypted: i=1; AL+hErHJ2QVPCLh9bn6zQMzOLLWwyBaJ3PS8ldsmhpP5pQ5cCQjRaoees9hpSolr71qzAonkoeYflVsZVy7sD/9v@vger.kernel.org
X-Gm-Message-State: APuU4Z9aBQHzSR65vxzdL9kPf8roCrwU5POw6PGP9/AHT3eGq0zPSyVy
	fJmeh0ocPZuy+YAXneW9eKbcI0QQzKV9hHwNaQPbfJTWRups3XWTGTVeGLrCxr81DI0=
X-Gm-Gg: AYBFou3bY9vzeoFaMdgFrkde3nAwPgfuYZ9TNoPNQlPXMyXu2+rPa9fNahO/3wDO543
	GkM7omX+gD3fWvVQ1oYwNZMwnr141e5EV1p5umniGNzyACoQ2tJhdQ8GWSeTbHZn2LJDtk1yquR
	IkjzQIGzYBshYG3/sMTrJKic0UYgYir7Hb7I9YOOiCgacYqM26dP7nzBNb0xMfCeKe1TFrVlEbt
	b7RmjXjFneTzag5d9DnHtaILi6V0bFSXC2dsPR/86V1nhDt9MlN/ubFXPcNjRyFIXfORzzmL5V8
	Z/JjiDeesbvn3+uDbWzAtQtr8b6PpFiNefj2d2t8D3qilvNtkSYBHPOyHvTieCe1FEtGjbZ3bIp
	BL1D3yUqrTlrBZywhLoJJWbLwXoRcFKOf1iCE5wzL2Ojvw1nqk1DqzL9bBR/qf9B9Fs2eC4U2VP
	74iYdgAllDlCkrcjEj8gaPtnkcIGa4fykKcp6pUaVGl5DaiWL1WCV6vzmwpNoyGuZp7LgG8UZoV
	j1fBrdMIaXMKLu7Rsdnp4crXVTZuXxLkPa0QXt6Ml3bD8chtnyGmtYHUuy+OsJxCim2JfLYUXTB
	27FVQ0pJ5dpqor81eQCJGFmXp15fUNYIqUxHQOPt
X-Received: by 2002:a05:6000:420d:b0:48b:1a0:5630 with SMTP id ffacd0b85a97d-499c86a10f6mr3780756f8f.41.1794398567805;
        Wed, 11 Nov 2026 04:02:47 -0800 (PST)
Received: from [192.168.0.167] ([109.76.11.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835c377fdsm8869991f8f.21.2026.11.11.04.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 04:02:47 -0800 (PST)
Message-ID: <3713bf13-cec6-4b02-a29b-8f76070f03b3@linaro.org>
Date: Wed, 11 Nov 2026 12:02:45 +0000
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261106-add_iommu_ranges-v7-4-5c0f72083e52@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2026 17:14, Vikash Garodia wrote:
> @@ -257,6 +252,9 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>   				}
>   				type = iommu_resv_region_get_type(dev, &phys, iova, length);
>   
> +				if (type != IOMMU_RESV_DIRECT)
> +					continue;
> +

This change is not about requiring a reg though, which is why it should 
be a standalone patch with its own justifications.

Basically the patch should state why a mismatch is dropped instead of 
being reserved.

---
bod
