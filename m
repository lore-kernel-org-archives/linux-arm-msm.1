Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832768;
	b=XIUa2Cryri5ps/D+Q+uRk7JmJLN96v7Y3mz/03itcOmwEw6oI/sWmvRxvsPmUW41YyOu
	 NuJnTFB4cEoYSPERNyalx9LHfR+hPXJv17FfgGJvEBwSmnPDFM9NMe//XsIfu0x/8KMds
	 VljvobcYUeEFvAeHj8Q2BFZehADN17eG3PVyLk3O0zCdTz2JQic15KPYJFUDtYtVbGnel
	 yEWc8zUKCkBVXLdPuO7JH7xjXyBjcojIEOB5KE5CJNUPu9AVo0z/CeLfOP7d/Q/9GpSuk
	 uk1NKT+Be8nsSkoiQxMEQ15Te4ThDiNjq4rWlkjKBNmz721jnGO9XEvswibtpzic5Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832768;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hSew5h3Dgo5T8HgB9FB6r1I7t6XZHsLAl/DRFJMr0Jw=;
	b=YSmbSUzXERE7M1uw6QeKq/KnCPXS2Ztl5Mup9zuUgFZ2RXpSqtGN22PhDLyUUBHBxjMo
	 WhQC29djKdLozMOYj40qEt41E8UWxLStD5yPOUgVKlqFituScmw7zXTKjqZdMPSUaS86Y
	 2pcU3HpCEb6CIU8ElntKHYt5PG3ecooARklapfF/C2+L+TVru3UZR3TfefeGx3NHHivX0
	 V35m3/UxhXXwNOHU6Fxcd5DBhIf8y3wJ9WGlLWqUbIvM5hhKJD3kLDVZylAYI7DYToJkX
	 2mNrkRolVvCXZWPisKQxeBjprgM2Kelh50ftuz7uAzneD0eISII0yxYgy7zTz1yRHdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=apchB3fd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQmKgGEK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11152606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11152606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=apchB3fd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQmKgGEK
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC1M1j1004655
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hSew5h3Dgo5T8HgB9FB6r1I7t6XZHsLAl/D
	RFJMr0Jw=; b=apchB3fdLb7InMeu+MwRH6njOSqpcMhxD5A41EE4UgHCtC+K3aM
	X++6Bz8Tl+4W4xLXr90JpO4hJuM6UCighPBQhDFw0xWY6oonB8m3X7My/EOR9wu8
	CpYtc2fTcs5MLN6z+10XH2zIgFTxMkHIfEmgcBL7C61edy/WI5NjF0rUC5oG8Y0c
	VKkqsCnDnmjxZa8ZyJxWwGM/qILHFURzSCKyYC2Vx+U/4rLdrm19VEtnZOf1brIp
	McNeDJjVBbgPCbuahxuYCLSBLJ+f7StoGqf6ramzu7H9219LR3dIABlp5fVWebA5
	tLpdJ4D+2//gx4c2EB2sv+WmIOZP7hSdRkQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j000g0fn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:39:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2c0e6653so291193885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 04:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794832766; x=1795437566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSew5h3Dgo5T8HgB9FB6r1I7t6XZHsLAl/DRFJMr0Jw=;
        b=IQmKgGEKZkK5rd0ZXEFblrlLUIFHLQ9NAZSpMbqFDpLlFw2i1AMmFkrUpMPNxz24xf
         D5BoXLSBhge7cT4EDMOuccKONgvQJF/YgGT5b4b1xgM0V2ajuNLfKBj9PTGX9PeXuRTE
         swFX0wuM4fiHajCxp02Ylk3x+TSi0tGFDUHN5YCzEbwkZ3XgzUcN+HkwEn+fvFL3CMNz
         iK6r+5E7AjYN64UStfkjyU9hQo4fOAMO9QIqMXO1PDU9OHrMYSE+powZE9E+3F6dpI1/
         QH+VeIXp/zTPofpe6Qw8s3MVEaVtpKYFRkqfWXBtln3b6WwRaDLHgdlaSIdhgIR9NkvD
         Xr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832766; x=1795437566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSew5h3Dgo5T8HgB9FB6r1I7t6XZHsLAl/DRFJMr0Jw=;
        b=SOqdjI+9tjeZQgc/WiQUX7oqUF5byPE0Aar+h3mEOX23uRi16IQo5QWCkFQEg0thMo
         s6rFRBfG4SyGXnHahlI/TcCgLn/GF6F5Ddy2oInFWvi8CGJE3tQNQJAaoDs4Z91TLejq
         AhPCLBBvm/EyicuB/r3GPGlkIPXF6aRn2Q5yyta9lMgorsopUMR3u9+k0+EPPUkhCvpz
         DQGTiuq413MeUzxyfpHUpSmjruzU++xp/cUGF1DliY0E9DWO9rCksl8apdINaLBEeUiT
         UJCuDbIjpOD4nzLHcIBxsgDUrwVTOxQ7YFbYBda9P8aRjRg3uicyNetul01EA2Mb+lbR
         YE+w==
X-Forwarded-Encrypted: i=1; AL+hErFhbuj9J7IW0DCzzo1kpLFMYJu3f+QsmXJGjsHKl4DKU9znz8Ly9SV9GfiQ2LJoDDj147IlJOS4pVNSwsrX@vger.kernel.org
X-Gm-Message-State: APuU4Z8iCtrvq+HnPe/rmnEivMgo58vsKTbE1OKOBFhJp5xObdDXfOI2
	iZLiJFai/60HmkqaR4qLkcePvyTKtGzjT/OsSXefUleuUCpfJpTBaDGGEIa9vgKmkUmAwW1C6NX
	fCoFVf46PcEAoVqxVT7j1NEuyzRKfO+owzAoOdojGsD7pj2cLm7gYNwUstI1ytI9Q4VmH
X-Gm-Gg: AYBFou3JA5j56kzcCK2CFPMMFdW1Dv9zTFZjj6AVLZ0WcP+60lNgO52VUP9zRB+FQdu
	OzI+pj126hw8AvMouvEoUBN77gLtGOVHSB+6k7PNt8mfjmE8W1SXvsGItHwz9QNVMt68t7+6F53
	PMo/UJAGozSNHH+hlfx9lQKz2WlBXo8B1NR2F0Twi0LgXC2PdLdQqXEDgQqw00UqXDbKcrhkskn
	zBQr6nS9PIwvJIQJn7UAWcGv4U1UDNSibSkGx+Owk8dpFvpYhwCNtDn09ZLhYcK0fxJaXCEuhZn
	IuLZKqWbAD1lc/THLKzM6sQq6eJuYmTsHWffpBs3R79HvAKA1bS3DlK3k2MIAKx3X3ml4+3WjRy
	fibDs0gwRuWZFNJCW580w6yoQOqMeTsxqo2u4FAurEzZoAaLfZh1PJCjGvjwVuNNM7E0creqytB
	/bI7jmf2o=
X-Received: by 2002:a05:620a:1786:b0:949:76ca:ff3a with SMTP id af79cd13be357-94976cb0460mr532932685a.38.1794832766190;
        Mon, 16 Nov 2026 04:39:26 -0800 (PST)
X-Received: by 2002:a05:620a:1786:b0:949:76ca:ff3a with SMTP id af79cd13be357-94976cb0460mr532929685a.38.1794832765791;
        Mon, 16 Nov 2026 04:39:25 -0800 (PST)
Received: from t14s (195-200-21-10.mclarenap.oninferno.net. [195.200.21.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223b21sm24532521f8f.2.2026.11.16.04.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:39:25 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] i2c: qcom-geni: Fall back to i2c_acpi_find_bus_speed()
Date: Mon, 16 Nov 2026 13:39:15 +0100
Message-ID: <20261116123915.10182-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MCBTYWx0ZWRfX/QPEZHdtDFEq
 TCY8DNKhRjfJszFbLGKD5pDT7gdAIudC4fmR4sdwrNT27SFG+DP9lw4pnJmZ4yJbGvCQAMT4Any
 Qn3YXzRdBDMfksvu2cPUOyLyTAbMme3EanqJvLWw04/+c7ZTJhFfvIpRWlUt/b03L/w2RqMoJNq
 t5Acm/GAoIo2xGOyOa4jLaThFVsxulyYCmpf5Hp6hHa2pHN04unQdWjzY5MfCcMYTNZUfjDz9rK
 f6rBWfUkYGPiV7cS312lA/uabDBioTM0XrFAqfHYpuQx0V52VDvQV+ikrTir63B90r7ex4O40CQ
 KgpxnIZqTXeSsFAg1WE7y6Jx+gBP0b9G54PmgsOSXV6wXEXSPLgCm7gXwjnFYQhhITZpHQ5kA/x
 5a8y9A7pT9wH3jZVb8Gn0cy2Aip7fJhC1W48jZpcVARnObd/EzvUgvkjGpU7EuwCAXB0+p6TUTa
 kVWdCTIxdqeseF52RNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MCBTYWx0ZWRfX7B2/ZRXv3Exm
 dd7KRywAtDOxhz2BO31OmrIaISuUbEsRMLXtmY1FwkftN5+6Pq7BtqjkTMLxXwmPgB8nQ8EaMXx
 AnFQwzFP+two1FjCw7gbUiKB3gGmrX8=
X-Proofpoint-GUID: u1LYaqaN3DOEUDRDhpUzj8QqvhQVNLGo
X-Proofpoint-ORIG-GUID: u1LYaqaN3DOEUDRDhpUzj8QqvhQVNLGo
X-Authority-Analysis: v=2.4 cv=Vdtir1p9 c=1 sm=1 tr=0 ts=6afaf97f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=LwtOfSRbDNzKn4Mtwg6Q5A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ebSNtY053JYnNN3LUkkA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160050

The qcom-geni driver supports qcom-geni I2C controllers being enumerated
by ACPI, in which case there will likely be no "clock-frequency" property.

Fall back to i2c_acpi_find_bus_speed() to get the bus-frequency if there
is no "clock-frequency" property to get the bus-frequency from ACPI if
available there.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index ef48ab3e8b94..cfa334e9e81e 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1200,8 +1200,14 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	ret = device_property_read_u32(dev, "clock-frequency",
 				       &gi2c->clk_freq_out);
 	if (ret) {
-		dev_info(dev, "Bus frequency not specified, default to 100kHz.\n");
-		gi2c->clk_freq_out = I2C_MAX_STANDARD_MODE_FREQ;
+		ret = i2c_acpi_find_bus_speed(dev);
+		if (ret) {
+			dev_info(dev, "Using ACPI Bus frequency: %d\n", ret);
+			gi2c->clk_freq_out = ret;
+		} else {
+			dev_info(dev, "Bus frequency not specified, default to 100kHz.\n");
+			gi2c->clk_freq_out = I2C_MAX_STANDARD_MODE_FREQ;
+		}
 	}
 
 	gi2c->irq = platform_get_irq(pdev, 0);
-- 
2.56.0

