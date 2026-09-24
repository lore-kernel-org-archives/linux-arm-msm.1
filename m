Received: from mail-ed2-f30.google.com (mail-ed2-f30.google.com [74.125.228.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F247409632
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253425; cv=none; b=HxWunLx+5DH5y+kXHvyVZjcQ5kgtqkInWOR8Xw7riAEb7VZUPFIGbk0hG55uv33vDOk85kemIRt6fZKh3IPLz4a936i5LdfYOh6T77HsQcc4dktEkk4mawjJX0di5wIxcxSLRnWPak8Y9hb2HlKCUtpM8qJSMgYvyc3bdfsrPlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253425; c=relaxed/simple;
	bh=uTofbiv5PGwwQfTIX8LTF3s7MEFpysPum854bwqS22U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BTmK+C8ELoZD+Vl+oA6Fb9hL8GPgv7OlWZ1pXfncoGB6BZXDpsc5nNuxumMkHkKtnDWJAS50PtfVijcAmFIAqgta1Qp99KsLxlElVMCapQoLd15G+uD5QYs9K3hacZbk4JAM0L1wt2ycYH8F9wJZt1YDUbglgefIq1iUulvGZ6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XLAZIvFE; arc=none smtp.client-ip=74.125.228.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XLAZIvFE"
Received: by mail-ed2-f30.google.com with SMTP id 4fb4d7f45d1cf-6aa06e51bc3so3316564a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790253422; x=1790858222; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8WR8pmB+jYgHS1HBlWGZgS/Xwn9pj8L3GvfaFa/VtnY=;
        b=XLAZIvFE1qHixlDUIbqNszybFfVEegD6sECtis0RfGvLXrtsEm/UhvfJwW77voeZCq
         iiFy9ft39yQoQsZADgO5JVsJz/aGso7ayBUHziyYpIGVYebDLF+LFAWRG+lwerOm5e7O
         UK2mATxJV1jxpKhfTLoieNjnLJfPOqmArUBLw6j/cFZpTEOOVcCFkcOgjM2LwtY3cdr0
         qETRRgZ7I2piujtBSHtyDnRmc67NlSSfcSzmPPLmWy+iqqv8qME2MEEuksM7/TTP1Cjw
         coq4i7RUbBFs5TputOhvC5N8p2AxX3rc/YdrLU3B1Cl2IZc7TMin8XnqyqpIo4dmY6LS
         Ux6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253422; x=1790858222;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8WR8pmB+jYgHS1HBlWGZgS/Xwn9pj8L3GvfaFa/VtnY=;
        b=LfZDDke9NU8VWWdRSn5wGxjf6qQrDfL+vsOPJtU4t4PUkNAq7qtx1/g6Tq9isTGH3k
         fKNYjZawojbWqdtj1SdTYXF1UnjSWwp3hEIdTNNpUqMDaa7WGj2WuUvqvHe21nP+wc1M
         B+lCPuJalsmWjbXtr6mZm/FTQ25yGG6VM7eX+fCiVavCG0ovGdYSq/XH9pBACJh6I3Pu
         7Ej62h1EUc8JBVkbZH4Rrs9mLLLq1KCCLG1PdzYl70S0wpEuOeXoD+yosdGYUokF3ASs
         Kylz7wRxmRFhgIZwGneuLqu2onDJtrWTKlPFuJx9wTR3qu0V0szD1ofgk1t1MXBIvNZe
         D8Qw==
X-Forwarded-Encrypted: i=1; AKwUvBxtbgSmWGNSSNsgf9qTLN7hvEAiuPpJRZ4mDNZD2X5xHcwf6Y6xjI37svWNRmW/jK3gR0NwH0OhAZOs2N96@vger.kernel.org
X-Gm-Message-State: AFuF++ljMNyL3CTylPal4SU7nVceanJBDZ9/Kc8dMRB981G5DerUzNjD
	E4cGIHndOQbG/InvwvoqHKLOYp5Gn0dNiqxtDejoxuZbG1FKX5zXziggaJlVN2FVzjM=
X-Gm-Gg: AYBFou0il/ctOQQ3INR/vVjHOKAxEXy3KnGBTS4w2sSNoaynugqOs95Mnx1ebgwNt+r
	UrxyKGt/IrrM1ahaNoSmv7YwcxFGdAI87c+nuDCb371aP96gqB+YBulibMVZ4KGEzQKJVjI2Q19
	qj0eabGjmPypgqRGGsxRq0Tnd+4an2Xeqbz/FFK94L7t/AU9RKx42VV5vxBhj44w2f9cmyFwa9A
	xNizZu4uvCD8wviMjVBsNDTpWMv7fxqXOh+qaFTYReHUFqz3uOWjZJpzLlxKoRglSFh5LIfvUkh
	bWGRXlbkGzDWVbJOTPfZq61ViaWldyxFXJVjOTWq9ly3e9elgVc4c1PDI4nUzt1LmL7Jx2E+2Mu
	Imww/ej06LI/oeuE+0c73/r/FWuC6WaXEGcfcEZ04N5JmCiRt5+lmwd73A+iYcEzlu0JxDrCsVN
	Tj2Z/2T1oihMuWLVCaYMACa5xNXgdJDjhraOmoSANX1dSuPRHZGeGj5y8btpwz8+ejOWlsdKWlm
	c63bwh6RtzF
X-Received: by 2002:a17:907:1ca2:b0:c29:6de8:d143 with SMTP id a640c23a62f3a-c2ac23d7742mr209160366b.19.1790253421677;
        Thu, 24 Sep 2026 05:37:01 -0700 (PDT)
Received: from [192.168.0.167] ([78.152.210.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab386e5b9sm3701581a12.8.2026.09.24.05.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 05:37:01 -0700 (PDT)
Message-ID: <bbf66d18-0587-41d1-a902-32686f66fa76@linaro.org>
Date: Thu, 24 Sep 2026 13:36:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/19] media: iris: Add Gen2 firmware autodetect and
 fallback
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
 <20260731-iris-ar50lt-v9-2-d71a782001c0@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260731-iris-ar50lt-v9-2-d71a782001c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31/07/2026 00:48, Dmitry Baryshkov wrote:
> +
> +/*
> + * Detect the firmware generation and publish the descriptor. Run only after
> + * qcom_mdt_load() has succeeded, so the driver commits to a HFI generation
> + * only for a firmware image that has actually been loaded.
> + *
> + * The generation is detected from the loaded image (@data / @size point at the
> + * reserved memory region populated by qcom_mdt_load()) rather than from the
> + * request_firmware() blob: for a split .mdt the latter holds only the ELF
> + * headers, while QC_IMAGE_VERSION_STRING lives in the .bNN data segments.
> + *
> + * The descriptor and firmware data are published exactly once, before any
> + * session exists, so the lockless readers in the ioctl paths never observe a
> + * reassignment. Later bring-ups reuse the already published descriptor.
> + */
> +static void iris_detect_firmware(struct iris_core *core, const char *fw_name,
> +				 const u8 *data, size_t size,
> +				 const struct iris_firmware_desc *desc)
> +{
> +	if (core->iris_firmware_desc)
> +		return;
> +
> +	/*
> +	 * With a DT firmware-name override on a dual-generation platform the
> +	 * image on disk decides the generation, so inspect it and switch to the
> +	 * Gen1 descriptor when a Gen1 image was loaded.
> +	 */
> +	if (desc == core->iris_platform_data->firmware_desc_gen2 &&
> +	    core->iris_platform_data->firmware_desc_gen1 &&
> +	    of_property_present(dev_of_node(core->dev), "firmware-name") &&
> +	    !iris_detect_gen2_from_fwdata(data, size)) {
> +		dev_info(core->dev, "Gen1 FW detected in %s\n", fw_name);
> +		desc = core->iris_platform_data->firmware_desc_gen1;
> +	}
> +
> +	/* Publish iris_firmware_data first, then iris_firmware_desc (the guard). */
> +	core->iris_firmware_data = desc->firmware_data;
> +	core->iris_firmware_desc = desc;
> +}
> +

In function ‘iris_detect_firmware’,
     inlined from ‘iris_load_fw_to_memory’ at 
drivers/media/platform/qcom/iris/iris_firmware.c:216:3:
drivers/media/platform/qcom/iris/iris_firmware.c:161:12: warning: ‘desc’ 
may be used uninitialized [-Wmaybe-uninitialized]
   161 |         if (desc == core->iris_platform_data->firmware_desc_gen2 &&
       |            ^
drivers/media/platform/qcom/iris/iris_firmware.c: In function 
‘iris_load_fw_to_memory’:
drivers/media/platform/qcom/iris/iris_firmware.c:176:42: note: ‘desc’ 
was declared here
   176 |         const struct iris_firmware_desc *desc;
       |                                          ^~~~
In function ‘iris_detect_firmware’,
     inlined from ‘iris_load_fw_to_memory’ at 
drivers/media/platform/qcom/iris/iris_firmware.c:216:3:
drivers/media/platform/qcom/iris/iris_firmware.c:170:40: warning: ‘desc’ 
may be used uninitialized [-Wmaybe-uninitialized]
   170 |         core->iris_firmware_data = desc->firmware_data;
       |                                    ~~~~^~~~~~~~~~~~~~~
drivers/media/platform/qcom/iris/iris_firmware.c: In function 
‘iris_load_fw_to_memory’:
drivers/media/platform/qcom/iris/iris_firmware.c:176:42: note: ‘desc’ 
was declared here
   176 |         const struct iris_firmware_desc *desc;
       |                                          ^~~~
. "$TS_DIR"/lib/common-end.sh
#!/bin/sh
# Copyright 2024 Google LLC

Proposed fix

╰─$ git diff
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c 
b/drivers/media/platform/qcom/iris/iris_firmware.c
index dfc4c184646c6..39558a300d38c 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -153,6 +153,9 @@ static void iris_detect_firmware(struct iris_core 
*core, const char *fw_name,
        if (core->iris_firmware_desc)
                return;

+      if (!desc)
+              return;
+
        /*
         * With a DT firmware-name override on a dual-generation 
platform the
         * image on disk decides the generation, so inspect it and 
switch to the

