Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364210;
	b=BEEq7BXVdAuijd25Mzkc59yPbF82/otypGcCTKeu7yOtUFy7RdMGD/0wyF7yXvZYq2Mu
	 5Byra2qs25XOeSlzsW9k+o6XXItPrk6eAXHNhAzNRwTm3B1jx0HDuF6EPdurd9hZkbzr6
	 EBvFB47npObyxxlL3X25OBxOvvxGnvdcMKCR17j5uXquRmQhDpB3qsFdnH8q0S+Y+Fi7y
	 1L8RbeW0CHkPXvcJf8MKPFG6sPxmDopDHXkynKa/LaodzTOmkrVQGpg1C6SupGlJO3k7V
	 V9o8RGC0KOowbxNyINV/WqYc8WiPgpej09+eBvH6TiDrEYUvShxDudb/NSu7JHwGgPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364210;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6OK3ZDmTnhLeioTQJQ1NAvYXYvXdPEZkiIm0BydC/O8=;
	b=WThr/jbPlpd+iIBMKv+gUBeczeEvc2NZsilNK/3Nlnb4rRRST9Q7yypeR0dYmae5CpOW
	 jkACBvHTPp+C/nsHbaCfG3jcwbMEN27RULc/xaNZQE4RhQIP8aAsQEDTKGJygXLpMFmpO
	 Nes3JfKYn2AxYSeWvONhY1KAetlM697f9wQ8feWvlIhwOPnVvZrCaI+4MAJ8bDgW897l2
	 m0RYLKEyNHQv8CAUZv14fB2dYuJHfbRYohFlg2w+G76MnyGge9drZrNBMEfCw6BAYOjBN
	 HGkre44sfLckyFnlHdAZTbMfZ3C6dPpyb9qL5aCL6V5DeyppuhE0kCoGOo3yUgqek5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6gj7HQG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cnRfjBSv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC66A606A322
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC66A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6gj7HQG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cnRfjBSv
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGGpg1527611
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6OK3ZDmTnhLeioTQJQ1NAvYXYvXdPEZkiIm0BydC/O8=; b=W6gj7HQGhDXp+iG7
	4V/LGVwlaJPU8X0isqrWeqcDf2mGwKFBxnhoJ/HcvsjrANqd8rQDEY+d8I+nDAE8
	P1P6nUPSsfO3DJe7APIFi92tkM/W7oMI0ShSPrSJQIzcm8raY6k6x7bQ3cvkoJ1u
	A6z+3/OBfxLUy6e+McQYDJIZB3U8EtBSjPZ+8oDhRHQoSQQ2vJIRbasGxToEiYtJ
	RtySHqm8kd7s+DkTwIwhdGv6tIVbkPmuXEj8lvPykq+xCEsXNNtekCg0n3S0Ku+9
	PgIwpJqKxLHYaqP/BqKK0IVMcr8jBgtUxKdrmRFl9i1dHwmf+2GYo+8jnHkLhubu
	8K7E8g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pk215-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:43:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eb361b86dcso4453715ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 05:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364208; x=1793969008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6OK3ZDmTnhLeioTQJQ1NAvYXYvXdPEZkiIm0BydC/O8=;
        b=cnRfjBSvvjPJz/9kBPn2anfFh/+Q2iyZ5Dj8C3Viye1Gwp2pC0IuLvKWGBAovG6pPN
         GfugOArVMvbOT/HmluJ8b8qUhjFyWkaRW0en2VmBFoEP685gq2oks1BrackWlUxwSlxi
         v1JcxJTJbi51aHhWWlcFpYIJnS0v7SBdq/fC/VSAQASEUs+D6ppMnrBSEZpkxke9TFEW
         hH+hbCGw1oEsalOH/FYykUMh0stQ/R9Z8v9kyacDtQH4WNtftuDuKOGua8XlvssMSLQU
         r48+rSVN2jXBJHTp6immlpFBBPP8Jb0Fv88i++rSPTCXTKox70RnehBUUy3qC22W87eP
         Fr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364208; x=1793969008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6OK3ZDmTnhLeioTQJQ1NAvYXYvXdPEZkiIm0BydC/O8=;
        b=zOeen1LNqO9/nuBqS92/RGjJeEt8bxZntdvqw+zKBmBGycyjiRIZ/Ap1A/v2qIdTrt
         vORMhlTIf+VJpAQNreieDVZ9LrdykB9XbKeAcUO7SJrju5IdF+ZUBE0Pdjyv7DY4ApIp
         MVap3stK9pI9TKhfh2BlM0be3U8pI/iVOE2sE4cwwbeFjUDGbzGy5ktQHqqYFl4kE1e7
         ZA3tfxr5sMIwe0dH3P7o/Xd3hqhZk8avrb/ojtjvKCPWkl4+RM4aOktSVlApk3rLzGKj
         XK6ZqxUgDbLuZbVd/kLNBaN8bvpCzaYH2P35bb5dUe+Dcm4TDeJRb+h0Amtmjcqv253/
         lwsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIDjS5BQimG9IIvr9CizWolV0VfVUJIugKwQq285DZpeSuqlJxgVk1Dhi1+5cwDHR2ZxfMJPf8MJJohqbP@vger.kernel.org
X-Gm-Message-State: AFq9FYJuCdFqKzcfdgN7R5IVh67c+8Jy4TpeT89d79o9wrENaXuZK4VG
	Hgjo2YAJjXeyIAd0WRAOSQsCjiAd0y+0AtlXdkb28/0whxdBag92ukbQ2Do9l6gi7JK0SOcMawW
	iZMW0sWQtDSGQNSL+PjLkx20jmH13ThWqSrjW3wlZtQJWnC0VgEuEaYiE2gkLzOXXSb3r
X-Gm-Gg: AYBFou0PRNc1TpjTnGD8SmLOdmmQJKIBxb9sVDCKH3O15C1LZP8UB6ctwpw+DaJQpf2
	SM+0UL326CW48ZounYNxIZUwMwaWnmbsGxiDiszdvNhYYvETTjOjbY4soV84zzPuyp4xEdyrHe3
	c3WWE8hnbDZNtatR4RaHCaGIwGcJOFXIISBlHlx/bzPgrHvYelX/01eE9wHkVONPHVhrajUkpUO
	UJkVH8aNxLeeiUaG1Gv3h5lWopLd0/rETFM3tIomjTmgZjVqvZnrog6Sk8QR3e1mCKzzdcIdKOw
	QNx358Q5sw38LDodBGnbcB0hqIwWl0KO4YxWKYBOTQAQTuAhrsWeH8F+ilkoktknCAcuDLb7J93
	324M1EAUHJidbC7BdiUlu9qdKh1cidCVsYFkt5Sni2w5Ixh8N2bEW4++OB45p4OzqDz8K7kUQj+
	BRN/g=
X-Received: by 2002:a17:903:3b84:b0:2e9:3dd2:a8fe with SMTP id d9443c01a7336-2eb3648b9fcmr24829645ad.21.1793364208179;
        Fri, 30 Oct 2026 05:43:28 -0700 (PDT)
X-Received: by 2002:a17:903:3b84:b0:2e9:3dd2:a8fe with SMTP id d9443c01a7336-2eb3648b9fcmr24829325ad.21.1793364207726;
        Fri, 30 Oct 2026 05:43:27 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f5dasm6450075ad.25.2026.10.30.05.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:43:27 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 18:13:01 +0530
Subject: [PATCH v3 1/5] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
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
Message-Id: <20261030-hawi-maili-camss-v3-1-9742bca8cef2@oss.qualcomm.com>
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
In-Reply-To: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793364192; l=1341;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=dX6MizZIA1isQ45cxUBsZgjrz8paPsRmmoOT/a2mOUA=;
 b=Goh1WlR0jf3fQOa50V3RiuKdBhpRNJIYT9f0lf6o9kErrJURx/R22pq/QSA0hNNZQXuLu61u+
 0vJJ+wrFvk4B5FV65gAwLZK0YrGFNAfIBqv5N7RItutaBxCQK+0/fx/
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfXyOEGosnuH43e
 gPSPiO5eiKW75fn7Ya/bJsxrsvqe5MBImh4o4v+Ku3S84eUKt72Uw0pRCcfdB6L5p3XK+TMcrDO
 tHvOnf7aZmKZr5yudOyws45U+CzC0tA73jupJQ05EKLs3xbKKQx5cqWBR/0hiMlOuCEss47dgOd
 HAI9XQUpBpf6Et4tFSkzsGzsiTj75DkzA0wLPZArXSS1khJ+5i9K0bF5XSwOLcz0CWVIbYoMicv
 49xOvKYFURdDtK7ZfbwoSBwhemYKxt+8eOt6nck7isr5yPHYPNTRKQK7jlapFIwBIjmOsXTG7Iw
 186P2f/AXGlgg2Yz1DO+Gy326jFFhJIqpkkTlW2ua4SZ/OJhG0JqPkRmn2XE6orZJUfeGXuIQPO
 9HHCIsorQSEONZQRFdXjgLVYKRGoEivkLaKylXGLI+x8qO+WmC2/V+HdWYUQcgx1TMj9URhlHan
 rgKuI3ygJ0zRPvjq74w==
X-Proofpoint-ORIG-GUID: sAv63p0ch6Mt9AmqB6W-8C11t67Uzn_z
X-Proofpoint-GUID: sAv63p0ch6Mt9AmqB6W-8C11t67Uzn_z
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae490f1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=EFwTI_IBlkk_uzUYZfIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX+aUys+jlihmd
 gfMNAxp49IXTBZx0rxfxl9OkyF0Rz/OXGxfKyyhA2WN5cKEd+HaVg+EMpVfkghRKmXVm4z79TZU
 BJmTVstxWZmzZ7moVP4aSyjQ0n7Y75g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300050

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Document the Camera Control Interface (CCI) compatible for the Qualcomm
Hawi platform. Like other recent platforms it requires two clocks, so
add it to the corresponding clocks constraint as well.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..b2b4d4bcf780792515ec153c873bace1764fb3e3 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cci
+              - qcom,hawi-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
               - qcom,qcm2290-cci
@@ -137,6 +138,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-cci
+              - qcom,hawi-cci
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci

-- 
2.34.1

