Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793947862;
	b=NHC9CZzr01IQY7qy+Kj6MOSmhiXPluQmZAckHY/XDwB0wLUR6IKMXVizTd2juFgdTD59
	 cyULX9Ng7LFqmCXFQM25Y7S4zRd/MjocFlGUn4WPlMfmfW56sGfVXRYyj+YhajRuY6eUo
	 PYv4tnAJCjBQt1IcNvvWtAvboM6bkA2wTmEVOfcZ+4ktCBasdHk+gTu5qUTg83L1cwqs8
	 E4LHmmYqhmD3a/n0v368j73Cy9aA0dwNeHtXjKOu1rqg7lXOV8wO7tE7XHRyZ5QAntcVU
	 Kjh/WHv8LnkLSWVokl62OTU67x8JRIq4Gn3Ks0uQq430aXFxLwattVpEqh9enAItHwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793947862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FgTaumbkJseV8Cy+AMTmURdrUUaRe7Y1v1tbBJFyumQ=;
	b=mqTIXKxDTFE2KBQaUYZjvFU2ZFUiwODD+kdudAthNDjY1lBct/AD3pnk4BhicSoc6s/5
	 oEKB9sckTzwSE06fAu0Uf4TGnVrFQPatFp8xJSzo/2INEGMra5IFLH2CMdouDBky6V6Ii
	 sxKr2komWNAkM5mioYnCDQQemrvFJCeMpPCLpM2aIc6p7MX2+YT8atYWow7iPaaBZ6VMY
	 HiROh3OzI29Y80UYgpo1KGrjrnFdonfA0s3hdnZ4QehU8qL/usN26ygt2wV9p79ntsm9e
	 3bItFLJ8pUmYLSc2h+O1fTGAcFyw06zhX4bl/SytEBlysPaVx/nv3p1l+qm40QPYEMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eaD9UBMA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OXHBAo/n";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995A0606D802
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 06:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 995A0606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eaD9UBMA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OXHBAo/n
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6408JO3440750
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 06:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FgTaumbkJseV8Cy+AMTmURdrUUaRe7Y1v1tbBJFyumQ=; b=eaD9UBMAJSVOeRHv
	67OKVKTURwH+iv7egpQZoCg5G3IHE7svYA9zTwuWAMBk2L8ieDGEQnyNDBRieRT8
	e/0L7AvJgHxui7qK/WTCwNpYQfYw9ZwBPBJlfnY2cLYjujLqQuYEi7zvubKFvEPY
	U66nqGI4vlO/vEwfZXqM1N3U8Ak8obddu3W1Ol7EjBHZyF/l7P74qh8BfeTpVJzY
	bGP90fmouxQCKsUedjwT3THlU+b1RiqUE2GLgh/9EFfBvRzet5e2W3BCSz+LMJUS
	r07rfw5NJTBIRRd8QG66cI89PIXu0evuHwVfS4tEwMOWRbR5wO9uhZa+28HihK2p
	SepOiw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pasegp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 06:51:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso299992a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 22:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793947859; x=1794552659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FgTaumbkJseV8Cy+AMTmURdrUUaRe7Y1v1tbBJFyumQ=;
        b=OXHBAo/nMVK2RWzgd3FivT7QEhJoS5LlQP7BrPyVEs7sNY1gj9q0J4tdNdXTweANbC
         8DWzW/HGClaiELMQCuCWLdJrMmb0gr9+Vpe0TKJWejFRnlD0I0x/0JPsA/AzQREzVbj8
         l8l6tKtLjjtPbevRc6TKCon3pGSXE4IpSqEsl3gBLQfpwa45Clk3sB0lImkEH3woehyj
         i273VTee5Gnm3hfU+dub66cWbF/Te4XK7D2hs/hyDA7BKpW6K1b3fNz6O+xJ2UQOOyAe
         MIzbfk4LNQw2e/8DZQkWxvSOVBl+0XxGIW7YMrLZLoyDMtA20MfoIpzgs1xTMBXr0gnq
         DEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793947859; x=1794552659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FgTaumbkJseV8Cy+AMTmURdrUUaRe7Y1v1tbBJFyumQ=;
        b=r9m1vmdgqV/HWenF+M5qAXxAP2LtBDSTM3XtlEig0FGlF3lUu/Tf7MMOgKGh3XFkB5
         sM1ZTKfhNzVMuRR4zaJfBOg5FOejA0owlKyyqixcpjlljxT+wjJLpc37kAca5Q1ryiLz
         AqL/6zOGEc2FUQs+Yj9eZlr1TyOuZSfNjvbweupNWWIeew2AAyijPWwnOZ0mB/ZHDtJF
         xX7crVYL87kS/ICpClB1kBcOFsh7AzSkM5ynVDUKX5ZarxCODue46ckyt+LZQhCcdBbK
         4PXbBPbTB6uchguWFV1xEkpsHoXXK16F2kaRxC58rFl/r1prcFcaXWNSh0mgEAlwB2Qk
         mG4Q==
X-Forwarded-Encrypted: i=1; AL+hErHb4hfnKEYjlw1hc1ZfI36Ii9PrAl5BdOlhB5vF6xBBpqnPa8Q6YH4egrwoPsplx208DpykPqj3u4p2PM+s@vger.kernel.org
X-Gm-Message-State: APuU4Z9bNdwrVi3B8Ib1xZNoU52qdS5t1kufg9iF6qsLzfIt99x+WVQn
	UduboxqYzS5DyHQLK1tOA/JbBgeps88DTsP+oS1P5dztCUaVK98ydwHkIXWJFOWqJv0EIID5fiT
	8Flvb7N9SNcdbfaoENG2UfEQd/4vuKpTrRrq1RQ+EjKR4ba1543Y5hHzcISylNjNIbe/7
X-Gm-Gg: AYBFou2tLMpGf5rzipKL9Iqrnx+Aalx52HO7XQmk80qknria5TRfsb7EqQTH/riV0ud
	eyU0k8RE0LfMJ9eD0a97DpVsUNYVDJbXw4cFMs4PMZqb6ZBhsg6I0YEyIvypPiFB49NQjqh2+UH
	4ezyg68bRpsDZJPvrijmH1b5eFUHCpnNMOyXNyQLxCSyT01hhF+GsN5ErwZ9Ri1SOYNWAY1uO6r
	BRNZWrPkP+3gyFUQjenc+6QBeNgekYNoqJQbec+PVBsB19eaSPU7uub/w6jhpuk2UI+KBEsosSf
	auYklb2L0wun+sqboZYmnslDdyZtjpfftzHrnba9IE829zgb9eNqMyv8OFvvPyWs6veIk0BlgJy
	DgxOQGfnlyzZWddo8FZQUAHq3odaG40CEXD6bN05ARA86IyR1hdmrchEuuX8gqAEQmBs+wNoKru
	DF3owN
X-Received: by 2002:a17:90b:48c6:b0:3ad:47ce:3876 with SMTP id 98e67ed59e1d1-3b0db71a865mr1318372a91.61.1793947859425;
        Thu, 05 Nov 2026 22:50:59 -0800 (PST)
X-Received: by 2002:a17:90b:48c6:b0:3ad:47ce:3876 with SMTP id 98e67ed59e1d1-3b0db71a865mr1318343a91.61.1793947858870;
        Thu, 05 Nov 2026 22:50:58 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b313c0dcsm6597274a91.1.2026.11.05.22.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:50:58 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 12:20:42 +0530
Subject: [PATCH v4 1/6] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
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
Message-Id: <20261106-hawi-maili-camss-v4-1-d528c7a797b4@oss.qualcomm.com>
References: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
In-Reply-To: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
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
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793947844; l=1414;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=Of5la7TwZQ/Mgddi78WKNJ7A1AYscECPq7KHX0+sZaY=;
 b=oc0WJiOjPuecbdNW1PjeNotzAGfBEPLfXzNtndxTCk2cf10DpBvORLSkKxuww98qe+zxAI9A8
 lfekXCGU7PsCp9YWcgzQ1PxbW4ejGV5eowPCbBGqQ/1I2hpLJV7nV60
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyNyBTYWx0ZWRfX3Y2aJW+ROy0G
 KoTiO68JA/LgXWESB88FQhFdjWlw7L2oBFpCj71DwZHJO3ivgsLBCvnfvZdLf+rhWh3Xnmqu+MX
 4K7hVi+/2qf90FKAFxpEU22YMzX9CLibgRN5DtS0OnRItacw12x/BVcjS4MPYj9VWDi57blxLJ1
 EGMQz9xwiiLJ4IRmHC128rZ7Va/CLqBEgcIX11z27J3V+wp5apHdVKKxpdgqQhM01ZAvn130OLF
 /eTVvdg2KeOGHXWNzfmxJsreXCt0eNozyyQV4uJ7yXHyPa2sct0qAB9pRRMa5BkB44rjyFENPuk
 uEikcUQrahqF4PNMpr9oA8wDjrkxeYlEDKhE7+r2PTdHabNG1aPNRZTNRS9cEc2Id6QO+GXjMw/
 ABXH3KkmdsWRri5RLc8uZLC7P0iNEGUanuFd6e+12SbvJxGwHazFVKJnI8Cw/HALDJaVC4NThJ4
 pVzdErhf5himZfHYTIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyNyBTYWx0ZWRfX7HErWSQ/MRgS
 GxsXtZz4hqnmU6oulnmLXKOnmLgOFi+J1fXvrnr8ASb2pwNbLC6MBvnX1+EOXBMElSc6O0E2A5D
 F0ronyznsnq1DGx1PVrce/X7JjN2LSE=
X-Proofpoint-GUID: P63BpIyXyoAQfmmHCDiimew3di1U-Vjd
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aed78d4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=AartCDbB9JJyHY4DVtoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: P63BpIyXyoAQfmmHCDiimew3di1U-Vjd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060027

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Document the Camera Control Interface (CCI) compatible for the Qualcomm
Hawi platform. Like other recent platforms it requires two clocks, so
add it to the corresponding clocks constraint as well.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

