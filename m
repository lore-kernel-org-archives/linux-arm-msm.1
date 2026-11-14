Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655858;
	b=Ko+rgPIfE9vky3uxL/Uxf0c7yLvQcpJHlOJN8jW7yKxqsw04gtfisFoPuVhgfBLJxNJO
	 zfiMosYOQzaePQ7lpbkFiM4X8C1tpZ8ME9d30QUwplih0/1Bjjj5sjiVyZPLWHKYiq4rW
	 6fIquZbyivjoarYzZMsj1v8nkNWkj6Vau3J3u8xlQG+yA/1zwEbe/pu2tnuzPU0f+T4eJ
	 Bhp0EFccJkAuq0mEpsHZbFuoGrmCjL9hyypOoAiOt9LApRhKNb9cqTMAQZRYcrsUrnQxp
	 P/qzO2cHdKRbvYNhGdIoaOfSgFrqfqkiZIiFCkMUZ/isYmkhTA1fZ7ZU/cFsSzBmYbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HvpnDcakWRnW3PYccxcSi7pSHHqf2SzUoRHYqMjmiUg=;
	b=4pnXhfPgzDbHyColcMibZRdro7/oQFWDxri6rlaAc4OFLEHVqgVluEloKhv7AYkLCM/K
	 Z959JJZ+LniWttRaMGcZmn7BBaxBxjGaULXeDoF5xTb9AWYYIdqDFsrE76eLLBa37bvCz
	 HYK8hg8HLpd+LtyfR1flnz+KD9zzfL6SYXHmqj3KCpxLzZZDY9QkAVPbUHdG4aiVv9T2u
	 jhzn9xVyx7Rx1k2v9QiQPfWncpNVmyxGsyHl2ozeM/Xzg02raAJ5Rc4CEVC/SR74kHsm1
	 MScIZEPOvqpn2df4nmvrq6dURShKkKoWP5Lh7Sz3cyD668Tu3hjceXPIlFlssbbY2pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=is+jw5w3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zo0tqJdW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBEF606A32D
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFBEF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=is+jw5w3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zo0tqJdW
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9w9kE3164313
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvpnDcakWRnW3PYccxcSi7pSHHqf2SzUoRHYqMjmiUg=; b=is+jw5w3FuItCwi6
	PB5nilGPbRX9RDS19eIHfUTmWjeWwtOiuzsjtMtiBzUhXYsXu0f6J9Gx5ufxZXca
	vRHBOCOydbv/BzFG1eo5U0cTLQsseAqR4CqZmJx7mkF39EYa60Yyq6bfKmWzNufl
	StTglC2ubE12WZDs3K7UGE7ahs6LhTygH7/ADGtZqe3rBfGXAzMCXP5VcWpO0Sev
	/z7b7aKFoTa/qysPoj5dyhOY7RKa+zBixU74Xfol2R4J0yZiEkbtlqUI3qjKnDpo
	fA1zU6JgKDwa59vbUE/slA0+7RslM6LNNQeV984stOJvpXWQ4zC0U4FFlRKRcdaZ
	+Ws2kA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkw8kj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:30:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ef0fe2914so36082806d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 03:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655856; x=1795260656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HvpnDcakWRnW3PYccxcSi7pSHHqf2SzUoRHYqMjmiUg=;
        b=Zo0tqJdWroERepjzwpX0jDTKyvivB88pDMMdsw8Z/sR230mLN3XUHdefHLUo1pgHkV
         DPPgPsGysGhdyeTwUnpJgQUBp6Na2Sf89D1ks8y7g398828EqrmOzeuOzxQR6Iu/nleO
         pVFU/UHq40/6UHMyhE5DeFifBfvKGF0wqQ47/OYqPb79vAm/VUM9pOSbu3NwL9yhZrmo
         I9uJv+MCgxU7FYGL+5/lKfQcVO15iMeoQIbtKGM1AaKU32fCQ/4VbmvNOYWYoJvcRjjW
         w86V23gFf5jcYB/f/1tePgJQTF9qXLpcqFCoyQmTcDIUGL7JpXhkqNwJuMx1A5AjJ+a9
         aKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655856; x=1795260656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvpnDcakWRnW3PYccxcSi7pSHHqf2SzUoRHYqMjmiUg=;
        b=RJxScYNmu8Q3it/GV4ODwFh2xEOxXXo+YO1NUmN2DC8VEYou+rJotcDc9dVDiOl2EN
         gtYAZ2g6EAzJ/AeBWDfGJ5NlHVjQl4XYH2ZWnWlCrm95Gb4Vgcdi+a8GsMOhJgZLP3du
         rjB6zXmBDA/26dnae2L9Nvx7CKTw9Z/O9nAVrmYZEAqIlEkuU8flEKBM8xcg6u4v4j4y
         Ldy4NmuShfJYD5WsxzZVUWOyy0OgVr3vO8RnFGGYm0iCLodFbzCqpHnJn198v7xucAom
         NzmJZHRm0tK9lkz4+HYB/bJihfUXaVKilfA34CDkIBvvCBp67K1AKcF+4Sl+5XdjQ2U2
         qElQ==
X-Forwarded-Encrypted: i=1; AL+hErFVFRDV/u2siZR466YrT7BzXv3ahYsoyBTjXsy5SffEyuTbP0P18yNH3569yb0Ab+tQ2q+ffSZiTDIDonf9@vger.kernel.org
X-Gm-Message-State: APuU4Z8Yb66G09oYI6P8b4oJN+BoC5v87C3SD2+V8UncKyPyeUw823NY
	+orvq2fgPgQqJiZyKVs6eDJ4N3CN58ul5g7Q1r/3xI+CmnXolDRVnaAUjoXEyZa5arLjNlhXrYq
	Ydr2efVSqBQC1xRDZpqj6XGtRGnSFr3ESjISghkL5ZZQ1Hn8wLLoraprECihZSGleq67u
X-Gm-Gg: AYBFou1m/RnCnixiwA6NS4/FJKb6Q9DsLIj2yPGIiyYnGqI2F6H/gS0R7xvMFqjlKen
	6woO0yYvaTFnl/JAxtV90Rxzn9ckcUVHFhHIWhMMfkfkQodHV61HUbW/5q6OL5j9zFtGdWnXEAi
	OCcjK2BCx/c1DpdseNTw9PWLaIqls0SeI+Pfw9Xhep9vs/iGo/9jEW+ziyoE23eSSdpqZ6O4DAu
	XwVpyZ5nfE+CpMqTJDvsqbSAT6iAGa9y/AkwZI7da4TiyhID1JoCezDY0/Ytj33CwK4HH9eU4ta
	B0OFzcvTTOlt0zPlP1AJWcHWvhkEwB1Gp9vezPqMYmD9llyvCgvA9T2FALn1s8y9jd/8lz5+ds+
	425ZH6ZczBTvrYUdNfp8uK7wKyJzOZGC9BfVpRQCLCLwgO5ZafOCvgASWdyoMW7G4oE8hhg30tz
	0cUdDmCWPXpLjH+RMUOAu6cba+QZHr9auCMZ+nNqxN
X-Received: by 2002:a05:6214:c64:b0:91e:7abb:a927 with SMTP id 6a1803df08f44-91f241c65c9mr86645416d6.21.1794655856163;
        Sat, 14 Nov 2026 03:30:56 -0800 (PST)
X-Received: by 2002:a05:6214:c64:b0:91e:7abb:a927 with SMTP id 6a1803df08f44-91f241c65c9mr86645216d6.21.1794655855778;
        Sat, 14 Nov 2026 03:30:55 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:30:53 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:25 +0800
Subject: [PATCH v7 08/23] media: qcom: camss: Add PM clock definitions for
 SM8750
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-8-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=1035;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=aRxMrdDtYyY97/huckpcHrUdtu8c4K3ZC3GA/RWZCDs=;
 b=vWhSMHcARnVI0vXB2VQvgOzisoN8ZRFT+BwfFUA3Ajfs/RhNvQmm+8FhnwOhPEPYq3FPs84El
 /6E37tDjOSZAaqDqFh+2KI8ArW+N1uCOjbs6QglI38hhbVXTFl71AJs
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXya+KHMBk9ZCS
 PpUM2i+GDd3HK02gpyBY/OqE+KuNnL58olt41WMqxul+RIfuLiNPSWXgek7+Ch5+Cy8pxhLMLPB
 LZakmiVS0hepkey2ykQjCx/WfdcXnjwVjUe2lAUEducPX1gr7ke6kgGgxvpTVeu3QzIPMQk0UjR
 GnG5adSk2moDR68LtpAL1lqKKLySC4KuK/hR6Ek7hw+ZwZT8aDq1rW790f6kjjZ1vMaMO+QwdlZ
 P51PB/hm7H8ydQEsy6K6uDotPxk/xF2xrSGjgZqXyrFu427akS8A7wv9Ayunt9YVAHskVwss4nP
 s+bgzAG4nQ+vx+8bbX6yl4sRcRkK2X8BRHIXgFeh22eD2VH7TCOcA4d9tDeB6LhL39J9xKyc1/8
 JOFZr+FLjrfTAExzbFKL9dTYS57y1ldkfhyId/aJvTUhB6hG00rlAoC23UHW4AY/nse5/yuV/s3
 gl75PgxEhAXz6Wn5++g==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6af84671 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=MfOgH6a12QNS3LiSQs8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: h-M4pvwiN-ldU1p800-PaNnRBfnDFrfE
X-Proofpoint-ORIG-GUID: h-M4pvwiN-ldU1p800-PaNnRBfnDFrfE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX22fd5qsJkSJp
 fUXhC7JBV0ykR4wGTHbYqw7Tvb3jGJEsQ/QEFhPSpPU4kmtTtKnhLmiQ1xNiOlsDdQeo8YKnlQu
 EWUVlq6s9iULZ85huz7TdhVxZ9V0RQM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add cpas_fast_ahb, cpas_ahb and gcc_axi_hf to the PM clock list for
SM8750. The CAMSS core enables them through the shared PM clock helper
when the device is probed.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 3f9dd3a2ec088fa87a9ea90d25c906d14b9a1896..196eebc2d7d118040319bcf967b91c4ca98a4833 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -6043,6 +6043,7 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources sm8750_resources = {
 	.version = CAMSS_8750,
 	.pd_name = "top",
+	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
 	.icc_res = icc_res_sm8750,
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 	.csiphy_num = 6,

-- 
2.34.1

