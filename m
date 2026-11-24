Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511761;
	b=Y1u6dab+t54zJLOzUwki1y2o5K8oJO9sA+YAvejg2KIXuSy+N1aYQKLX9U8oJ7+zhSfA
	 PM0FK1wFdPLVuDDwd5oRmXqrwMwv0+iVmRAKO08KCO2rQB7HHE9fcVAjF4pFakcHHozct
	 y7yx1OrnXKagzRABReF6Jz8dufr/D+90NMyat8Ho0SAvbRQUDDbfp2rj27GDi4lzwk/v0
	 RV/VccExLwvJEfkFez0tDturjUJbS6q+wyG1FRdncrVjM+ikDa/8ux6MGWXsUOEE2dk14
	 LpmhJZvnTmk58VkZbU9cSaIsKN/3r7w4KdYm7U4uS6CJcAr35p0D/gChR1nMFCDvDTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511761;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dqYoJREBt1bLcGHI9N6tEVrq0M37iQpxVsxlfBNiSFw=;
	b=DgA6SuH4h8kwXz7EuhKtmdSmEB7RjkTLK4j9fZs2DI8Y6r63NJ8yOcnJ45iUF/UPqyof
	 pldifTRDTOJfGHqWDZPjVC7AEkMpFSTTY9yvGo1DANUH67oXERsaYmMH/4gZaGdTykRi+
	 BuWqNgrdmuBxECD1A8/FJ+8J6pn1Rf/+oN5Id2yRSS0ePdH+T7ndg9j1NhtH+wf/aqIWY
	 vayun/xcJSfnK5WD5YOC7mnGCdvDR6JcLBqh2qcnSkLS0Jjh8jUNTmqkNZDoFYOqrJNE+
	 2nVNkNr7CoShjKt/UpnTBBCURHz7y3YYVixm+dsxl/EREom7DRFn4GWmySP2XQy4cgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lxGS6a+E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C4LgDr67;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73343606A32C
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73343606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lxGS6a+E;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C4LgDr67
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5mFHk4136064
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dqYoJREBt1bLcGHI9N6tEV
	rq0M37iQpxVsxlfBNiSFw=; b=lxGS6a+E5EMIxMX6vdtL2OVnDWJR2RN2B6eoz0
	P+7tbDzY63jsyUDvXS+Sq/yX4gYUFRaFseQtveYeSONZtnMPbRGFnfMc5XyyIOup
	xelESyQfhknh/1vh/hAPzfHl0POTusonpItunAUcq8E0jGnfFZyYOXP4RA1MCjon
	ogmVvmi1VdbkpxAxf6lj3xSxk3wJoIyE7dx21wONB40VBN1+wAg+3I981ee1v7Kc
	4WpOvKOLO2sETMK1dO7gYn2XBis0KLbRIOwN7nfpwbrhCqB6lViDsZPMxPKXQYwe
	GsB7LTHpO2QyquSF01xP6PXAZpQNgYtPzwa6tqqzuJ338YBw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpgub4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:16:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cde6bb2c56dso2351815a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 01:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795511759; x=1796116559; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dqYoJREBt1bLcGHI9N6tEVrq0M37iQpxVsxlfBNiSFw=;
        b=C4LgDr67aYxaPNDlY1gssuPOXJ2EqGAZ30NOLgaZwpOOhHwDAG9bJv+1edt0z4oZo4
         Pw9A+Tsy4azMtQIQTi4CpofwrLJQczoiFEX+OxqlOedNUSCmrgoPIe8H9eN10rOSsb1N
         XMDudvzeHmYeNUfZhogXbWPKHFu+nkfJ1I0XRefikw1Lu8K9LHZfVWTZHzZXG0eub4jl
         vhzJYMA3sCKBfrwJ3rHo/3mp9WaoHQmJq+N5qEr1mGfQHjxZ/lTc1qwnBGn2IGGkp7/T
         g7DYL+ONvQDvUJenh7gn4D8qWAiYkyHocH48hW9tZkPHGhpURqbU2k8U1Tg1IiwlhO27
         bUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795511759; x=1796116559;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dqYoJREBt1bLcGHI9N6tEVrq0M37iQpxVsxlfBNiSFw=;
        b=g3KwYo1a4db+b1UhlXGoelcdYA8MbPso7XZmdeluxAzq56Oe21eMfjjAzqpXaHk3VG
         qCugyzPIIiD5VwmAsuHXBTOyPDFZ5v5XbCGb2mXFzsq30JRqlk4VWWBiQrQyCDBnx5YF
         nE1f3DUfoUdfNRr8yVkrqqx0UzLG16Nll59X8N/VqdbaWascT9n5hMPsPlnwF+ixs/My
         Z1l3jO76hmV5AmWnirAeHIkGLsYBd2SvieTcdyu3JZeF7WbWLWxUGuZQxBV5ZZXGvsUp
         RXqI8ehUXGodXJ7JSU8uVZdAptV8HNs894hlJvO4UxosUHIwOd5ettHmCt1UBuO6LkhU
         H6TA==
X-Forwarded-Encrypted: i=1; AL+hErHrH1cbE5NNHLivP0PCn6SorEghlKfxEajAmVw2HBRC4cHbOn0Pem9rp8jeflJaDESwKXigDr6+x3DebGrA@vger.kernel.org
X-Gm-Message-State: APuU4Z961pir459dKzN7rfEUVwgcjbP7jqrhTH9VLw1RTyL2MzPiKp6B
	B/ZMEOYcLBDlaLXvfISm9nvbrrgM9wNsmI5LLZ6ubPHmZ+WgPni0V3JqkyeJRj3v7PiYelBD8RD
	AtUtd5ExoSaQ74kSvzSVV1V5mo/9d+eQPzPpT1g63+O53Tho7R33DkDhmRYG95JU7jUuy
X-Gm-Gg: AZFdTZd1fZxTv7bZJS84pBG/j+bl0TGNXWDh4Y3YoBTeBd1VxbFDNEFH1HfPz5SsL4v
	iOWaHZ1vpd+bUW3qbXnTXuqLEKDWa0DPA9WMatQeXkwPGbOy9Xpyoj42XBeVIj0ZMoIRUyzFiqS
	iOFghj8Vt6gu2uSRWIEMZKbNZUlxNcVLWx9a+Z3sI/mTOAZzJMcr/Dyr5pgcZSnhOpqP1D936Mt
	2W5TxM7gm6YPEdKrZJb5ool74UA/7NBsCmb0kUh8MnoT5/Y5qsYhuMjMlVuHN2vbIFp4gYj7hhN
	CDxT5OcWniP9pF+Kp/S9ap1AtEXRT2/4802qs0gTyZTZXxHn+pRFQZbI9Lvs7xYEqApWvhmjaqU
	j9DCIzpUkXNHZv6p4ROqf/j6azcrIy0abvvUoz7YH9zzM1mrVa+5M1Jvzo2Kx2s8C8y1+QDN1Ce
	Y=
X-Received: by 2002:a17:903:3b88:b0:2ef:e0a1:1015 with SMTP id d9443c01a7336-2f03f1fe25cmr125521705ad.27.1795511759358;
        Tue, 24 Nov 2026 01:15:59 -0800 (PST)
X-Received: by 2002:a17:903:3b88:b0:2ef:e0a1:1015 with SMTP id d9443c01a7336-2f03f1fe25cmr125521415ad.27.1795511758834;
        Tue, 24 Nov 2026 01:15:58 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c72sm66371825ad.54.2026.11.24.01.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:15:58 -0800 (PST)
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: qcom: Add SMBLite charger support for PM4125
Date: Tue, 24 Nov 2026 14:45:43 +0530
Message-Id: <20261124-smblite-charger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAL9VBWsC/z2OQY7CMAxFr1JlPUZJmqRNV9xjxMJJXIiGUhq3a
 CTE3Qkg4YWl9y3957tgKplYDM1dFLplzvOlgvppRDzh5UiQU2WhpXay1x3wFM55JajXcqQC41z
 gOhmlLaRWuR47aa2WohZcC435/13+e/hwoWWrjvUTiomY8e0YmpdB1QE+5b+CsGwc9FeTaIWbA
 gkWffLKR+eC3c/Mu2XDc5ynaVfXyxqQ63c1yOvQjAqjMbHVMWDfY3I2RYrJoO68cyopQ751Von
 D4/EERKh08gwBAAA=
X-Change-ID: 20260827-smblite-charger-for-pm4125-d3168a705520
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raj Aryan <raj.aryan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795511753; l=2114;
 i=raj.aryan@oss.qualcomm.com; s=20260507; h=from:subject:message-id;
 bh=aVuiSjqEV1YfiTymSW1N6mxdxrH1RhDp+PZHYkBZdnw=;
 b=oe347MXBW1vvfgfDoGY1WmUX887vFuPSm0pywRhooiMMQH2KypR8EdvYmdeiKt2dlqthWHX0d
 oR3g4AoeLlUBthPpjnAqofDgrom1s3E5We+DVZ7k/uXdpwEymDSlJW9
X-Developer-Key: i=raj.aryan@oss.qualcomm.com; a=ed25519;
 pk=NMkZ/eGFLSObYX6FfysQiuEElPoUYghk7+2Jtc4VEBQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNSBTYWx0ZWRfX9nRyBYaAmHP5
 V1jYAf7d67NhwExvRTTfCg3TEeP0nsZo2+I+Dylih4lDvQTpaASRI9oRqMVX9rZ2VceNy4gJ356
 FVAgiGPXWL0Wn13SFs9jmxvte6ygeYAwcJPo1u2terR5DySIirYbD6j3EUC1di+0OgbomeQtDsK
 ZQdwZjj88qQ+ijiBNw8gpRFiijo3muW31nTkrN+Jz7ABkxidUTbgHVEJjYuTwIHTd3oPl6MrPRU
 GLF/HceMuY8UsFrJMXrGeLbIH3gay4DRJSZxGIQSH2uAiexLQjjQ/U+1XPpNkwUha9SaZSidKEf
 I8Pd1+xErZTtQ1biz9ehgOm9aSdtpcGZr4mlUw5jNNS3Y61MPTx3yjdjWIubiPYAxcKGm8pxDvo
 N6TiAKqMt6RQNTqteSrxzd0kFzL5DO+yg06W1U2QfyXkISdQRFLZnH5ImmfOeJLi0vISe244xYL
 OYYp2sTmi8NRV9Ao0+w==
X-Proofpoint-GUID: dsPMYrXJpvbRn_A105VLxH3Me2Al4n-P
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b0555d0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Ii2Fi2QEgfE3HPZJVlYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNSBTYWx0ZWRfXzXrK5MrKwlXD
 vZ3O/6SqiuSg1459qVXHxAzS6fzITCoRcefTLkmka/Pm3qf1vYrjAWm7GWwp20JtWZy5kn3vQai
 7DBDg4VYo+sR5aus3XYug+Dyzgmg8Fg=
X-Proofpoint-ORIG-GUID: dsPMYrXJpvbRn_A105VLxH3Me2Al4n-P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240035

The PM4125 PMIC, used on the Qualcomm CQ2390 platform (cocos),
integrates the SMBLite switch-mode battery charger IP. The existing
qcom_smbx charger driver only supports the SMB2 charger IP found on
PMI8998 and PM660, so PM4125 currently has no charger support at
all.

SMBLite is a reduced-feature variant of SMB2: it shares the same
SPMI bus and overall driver model, but uses a different register base
layout (five separate SPMI peripheral bases instead of a single base
with fixed offsets), a different battery-overvoltage status
register, SOC-based recharge instead of VBAT-based recharge, and a
different JEITA configuration sequence.

This series extends the existing qcom_smbx driver to support both chip
types side by side, selecting the correct register bases and handling
logic based on chip->type. This keeps a single driver and power-supply
class device covering both SMB2 and SMBLite hardware.

This series:

- Adds the qcom,pm4125-charger devicetree binding, covering both
  PM4125 and PM2250 (which share the same SMBLite IP)
- Extends qcom_smbx to add SMBLite register support, JEITA
  threshold configuration, and SOC-based recharge, while preserving
  all existing SMB2 (PMI8998/PM660) behavior

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
---
Raj Aryan (2):
      dt-bindings: power: supply: Add qcom,pm4125-charger binding
      power: supply: qcom_smbx: Add SMBLite charger support

 .../bindings/power/supply/qcom,pm4125-charger.yaml |  109 ++
 drivers/power/supply/qcom_smbx.c                   | 1094 ++++++++++++++++++--
 2 files changed, 1090 insertions(+), 113 deletions(-)
---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20260827-smblite-charger-for-pm4125-d3168a705520
prerequisite-message-id: 20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com
prerequisite-patch-id: 7e516155b3e55cfdf0e368296b467c6d89565b9d
prerequisite-patch-id: 85a40d3799c93e0ff515f7ae2f9642435acea45a

Best regards,
-- 
Raj Aryan <raj.aryan@oss.qualcomm.com>

