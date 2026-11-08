Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117273;
	b=DrcaadrnchgPfXnVe+W5YKD6AgohTItfgcgbWDWuLMVO20uk7coHGZHkQbGC/P02aHe9
	 NtsjE+511pFRknW1CuIJAxaRJbbupSTY+co2NBk7s22QmHL7EwHTQNn801/zj7cml8NLi
	 WSLooyVUwSUEUZgmiw0pefA/ZKQzvSdLwz9VlXe3J8/8CGh4NMYVQtVcZk6o0KrVcFbX7
	 lRMIeOFprTFwBYuy6qKPURmhdM1DGqI3EpQoBpeIs9kEA3oxAAD9NZFTulRYtXOCRbwNN
	 uQ3ztSV5jspGgMUEPVr3dpQ4LJ2++SwLzfWCqSaKfF8TSYe4VHWlix9JBGYzuyRnU8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
	b=MjAkRuGNu3CYdEvpus7CnEBxZYShBgg+fd220F6wHrCiey3UfL0sVA498MBg/1SK4dAa
	 N+5j6RuuNPZtl7tweaaa2Tmw33I/M4pC1uPF+zJ0hmPj7mh3lyyhipNbzzj+19hlcb80I
	 6GKtGGL4e9tCdGiTsj6Sze860DEaP76yzurSKhQcCwkaqFxhE7O0Zq5xNaSPL2E4nmppg
	 NO1+5wo8mAYRBBRXtvP9F2rI4IoRA2Zpm3f63M/HwmB+6L0GeyGDW55GVs5EMS6fZXH0A
	 Ze7NgM6frA2PHiL8lcWKWQZ8U3uhzxtb+fmF7ANiWldmUaovK3VZdwOK5TWsn3et6xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WBZxT6db;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7501B606A31E
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 05:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7501B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WBZxT6db
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49318428d98so74414f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 21:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794117272; x=1794722072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
        b=WBZxT6dbmtgGu4NX/AXvPKKVj319Vr/Z/eOdd2LIEwC4/4NrJcpuVqz1zOzGGyb70v
         5mJ/I/I1anK89arOMd0mRfkDJYm/TxSE5de+mZf5LIjwwG6/fu5pR+oArGYglD3KUx4j
         JFN4+64u54wJ40hNGqjFDrT+p+Ky/evMqZVy1ACMH8vagenfG0xpFF0CN0wwtLXtledx
         0NcHZqMzrtpOrecUBABlQGBd9VV/hgWv+0s4ynYpSFCTod2+xuIVLhMq/g9uZJ+VzKZk
         YVX9Y8LYDUS5nk1ZrpeZ2vU+BE3JZ15crcJqmHhQYnArxGf8TUeSd0XT6HfQXz93sI8n
         yBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794117272; x=1794722072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
        b=JpASFKjvMJVjZuUpSZ2BHFeaq4ONIzrAK1IjckzvEe2q0goVZKZ013ZC1LsXHnme/s
         V3EOEKGAagoHlSE8Z1eGIDIoQPwQ9iN+uQNPP1pwBA1flT6I6i/0RJ/uCLexh3dolMUI
         qQLcZRRggPPs5u/mCbLUgwylx0XF3cYQSMgku6lY95EYjEhXDsu3ibN4Qz2XpqlZQf2D
         RX18HHQZiT09l5VsX5wd8wOJyl/kLsUmYhOWcl06au4eOh2LWSz4TD6P4B1aEaJ8t/Np
         9Yu/iCpOFkVRPxzvIV9GQYHZJX8SuGWDO+Y0Qn3EGSlEk/E9rqArMV+LL5vCntIjxn+9
         G6TQ==
X-Gm-Message-State: APuU4Z/Xf9ehAA8a5qvW7LBz/1+LlAM6f5By4wYKh0GORPWyWgEeqkvB
	8YgZsz0wre68R9DAEKdHnQtadoZfBYLRrxnwKbSUnLXbtkU/YbuoEcSG
X-Gm-Gg: AYBFou2TBA6Yz+S18R5x8CjYbg3XiFQSuI3bTFzRD0N4fHPScksA+ORkHsZUXnMZhlO
	7UayCbGyo4SNcVXf6OWqTEH4ciq6cHyw/OnqV2pkXBZU3nLFq28mZTKxESmKD32xNd1mIKA9/OW
	1kLe0ewoZiyoFncgacu0wwvjvydq4fK1itQR8AAvfdKJQsLtiPEhlQ06BxoBLXlvnqeb0fONTJ3
	x7tsJmXowF+vn3+P57z2SyckTLy035lA/ByodE7mJ56CTKpJfIc1ksPOm0BoM8g5V7XDl1S7zT5
	WgxZc44ALrT46HQZU2/fS/X+zAnP3YgjbebTICRUWqJ2Zutt7aZ4VSz1OLd3OY4rbMF0UzJWt8e
	EcRNCfW7FmjeEq/r4OEx3pLumIuRsb/uhWLpVCDlwxDct4lH3Qz1wS7JGByjQaaju6l8Y5xzMi8
	rGH6F1lZc50pMIAuTh30Bj+HjOEgeNS9wr3pzSg5E7MMR/dyDv8wykNb8S8UB17jBKQR04nI+/k
	zK3OUG47w5QrdQPoxQPkxeJ+b9aEm6YynsDJ9VrxKVR7oJY69/IpR8XmIF+hBtX/G8N/UY7uyFz
	8nj2kHQokdvmd30di/OG5ty8/2LSN/qXNOtLcDA4DF5ANHBfZLI3qFK4sXZDfg==
X-Received: by 2002:adf:e19e:0:b0:48e:44c7:bf0f with SMTP id ffacd0b85a97d-49588ce1818mr1343254f8f.25.1794117271833;
        Sat, 07 Nov 2026 21:54:31 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm2113363f8f.47.2026.11.07.21.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:54:30 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Sun, 08 Nov 2026 05:54:05 +0000
Subject: [PATCH 2/2] soc: qcom: socinfo: Add SXR2250P SoC ID
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-sxr2250p-socinfo-v1-2-06244862f5c6@gmail.com>
References: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com>
In-Reply-To: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794117264; l=679;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=6bC47xmeKrVS8XaUkfpVIXGQqamVpsrDydmAXACmpko=;
 b=eusKBr2+0jXtX2V+REaLhJvjDXWsVAPQF2wGIpxdLnCYV8LxqKnT1CEBOuxNDsOIg4ut7aHdV
 pYEIRbrScwVCVS1TplNw/GaP76/vXN0delHjd9m9g9w3l9CnTeLVhpE
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the SoC ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 38efc5db7fa8..c5b61d28fc9d 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -529,6 +529,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SM7635) },
 	{ qcom_board_id(SM6650) },
 	{ qcom_board_id(SM6650P) },
+	{ qcom_board_id(SXR2250P) },
 	{ qcom_board_id(IPQ5321) },
 	{ qcom_board_id(IPQ5424) },
 	{ qcom_board_id(QCM6690) },

-- 
2.55.0

