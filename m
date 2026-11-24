Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513200;
	b=H4GGiXOzt9wJvzIj+Xr8c/Y5F8OoDH/lrFsRWlJn6LZ66PkDdW/a1360DgXP/pqm6Egm
	 ZuqILy7Sr5S3H6Tb8gV6cq3D6ZVGn9K3lGXLVCdX7LdKbKnPgFOg0Z0udGXDwKuFtwp+n
	 w66HVg86Hx41p3umTm5bYwFbA/4VdoTPRgJlTg3lQdc11tfdl20LRDlpquA/lOSafqXyC
	 em6ixEjXU50QDecrgzrAPLPwTbghlSqc3lxdVwgMsofrOGnJeGzQevwOFM4/puNqLHsnJ
	 9vSF5xvmrlrlSkFpowEK6w3NMZ1/ZjSHRYpqCsniKT3yyw+oEL0AeB/qjsMtoCo7/pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513200;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=;
	b=LVK53i7YBCT/2CBBBYW/fWGW2uXRBlmgjmhhHdaaxiieH7sZ304ajYz1NLeWIKaYOBRj
	 O/TJPZ9bgjQ1vp/xxYm/DowmXV4LRtErT8pIBtB/w3nYPhm/0fQSFN3rhXUciMkIDtQOl
	 gxRSOSc1XWeFvx+peH9LNH63ZW3TgPqXrGbz2mA4xOHt9/UtAY0jCm6gzHHh6I2WQIC99
	 uD2/2cfEB/5BPyWKfMLRqc0GEBZ8+qZCWRHZ/Nhy0kYI7lSZMVmAVBBLE00k5P9I2MaBX
	 FkZWrG1ONZx0EmFFcw8GKUkE25NA1E9vEATq3p7Ww9U7QIruGYY4eupaZ9aNYG7FE1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMYUaReo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZOs4ibh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC40606A6A9
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBC40606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMYUaReo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZOs4ibh
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5mPQN4136400
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=; b=HMYUaReo9cdZsNzQ
	8OrBLsYkEaprF00RnHQT/qGHqk1Y0sXVayAF1b0FtB03b86LLvWTT7lVDfrIdOrC
	Qe3MIeHOcXrJLBB+57fG06NFGcueSGxKbORt60ydfBSsvufEdrskcbAf944zMKO3
	GsxGEmaeAqdWNbyzXDM4Mzago6HZBrwf/aA3giSZTWOtgEE8UnRbA+AareCfdgu6
	LoLs1rksnBipB/Ov7kH1XutWtJDg/jW1q7eS9OMC23a9rrQOqociLztFtHuQll2Z
	nPvAiQyo+TzFq36gcrb+gznpoBw/T2HR+IT41Y4ED4v+HhHz3lHQRmtPaunPKQMV
	+OOVwg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpgxwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:39:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a05a4396d2so3368760b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 01:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795513193; x=1796117993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=;
        b=VZOs4ibhN3JgexrYqwmn1xriGWeEkjuSZfQmOpS/m38IchOuu6kaTG+ShNJhwlEGRj
         kXcSprYWFKCrysHFgwr1iSalVJtEPEqrbiygrNsdVtGCCbt8mqx7JZNxk9mIVPMTPzyv
         yALBOwULcQezQLQqdx7aJ1G6uw1mA4nGwSlU5kxDKKGtApKpZksxr/2k3idjSIMQZUJs
         QPDsIUWf4FpjrU35YNRr1zwf4c5wFOovN96eJKkuY/zEZzdz8s6/Mj6M1alCZhLhFROe
         txOq/ozbHUViGjcsHbvyAXWFUSt1zk9BD9NkTE7HmI/RZN/VN6f3mXo6l8JRoxyhJMkX
         tG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513193; x=1796117993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=;
        b=17HI4DOs9HRDlLd1pH359Ihp9fOx1GTrS1ExRYy5WvJkaUa7RJz5x3O3rdyudPvaG1
         s3xS0hXQbafZQeW3u2gLciIcQhZpdO46RgWOUMAsNDrsm6j7i/2gQjsZkrwT8dJiC7+y
         PrbX48G17IN3IY9WZxT5NKUB/QtU0sQ9c2sO0/n3vB6EtLTulAT2LmyvJ1DfYAXPCbLM
         1XlQgJ/N3mLguJpzJQNU/m6cuX+IIKquK88nZdSwc2zP2i+YOgFm2gR0ALVZYKd0ICkQ
         +JqKg1hlndFzQo8OxmYBzwxQg+gFDcwytvhI1tNbL8g603Es6j/+nwmuuUUVvDBEzGEl
         JblQ==
X-Forwarded-Encrypted: i=1; AL+hErHL/Q2e00D19Hq5QUCw810y4lCZ6pBzXJstdpccuPz0XXrNh5F9a0X78MdX3qUhtDKxXBKFgIbVvbBmmdOX@vger.kernel.org
X-Gm-Message-State: APuU4Z9ikPFfYHyzeQJmY+0VLEOYYa3BUWwrKZaUDNVXJl1Rt6rBYRZ3
	IcS++1K1Q9D/tn6WXGetGYR80JoT1NRQ8AgB8Ag+uuWfCeRqdLp+gpnv15ph2t1m8xe46SKwi0U
	rRTPNsazwT9lef9+zGVrL0nCoZfW3r0nY9qvHSC+HHnZBtBbL8Vws36qL/IdDEg2fGwV1
X-Gm-Gg: AZFdTZccr1jMEWdO6DoLJFzyg0/WXwCrTXr096Fe2j4JQVVbvgIhdPWQi+s2xGKfHCB
	w5/lTFcfX4S7kiKnfhGajLABDZMgneqpwfRgSVHmdctWfHUqtGmfbwv4J+B7L+yEAj35xUFZ1tm
	XKyzl5fjKqq3rh/GLTvsEYhiM6ReGVskLy+La4ni1AoehWXbxkefE742q2w2ICTnopgCRVdPAkL
	vHAo2Nmp+bhRqWeZE3A217DoT9g4qS5OESanETuv1+TDB5Py2WoQS9cEg2w4lTqqHQDFcP4xP38
	9J+7Jq0XLl08B7CMZWkSU0ndiQfcCAsz1Fgwit0iKfVXOiyHttM7fd11fDorJqxGfnJ8utxH7iL
	tzz0mzyjWNIhIJ/atm/TDR3tBcFciGgmEOVEimAUnhOA8LkCaMBPOL8MAER9/b4kd3kRw5Vglge
	cPdIWTabhkVp5UXclNNO4qJgodv32jOar3VOXt
X-Received: by 2002:a05:6a00:4109:b0:8b6:54c2:a760 with SMTP id d2e1a72fcca58-8c87bcbdd7amr12646132b3a.13.1795513193026;
        Tue, 24 Nov 2026 01:39:53 -0800 (PST)
X-Received: by 2002:a05:6a00:4109:b0:8b6:54c2:a760 with SMTP id d2e1a72fcca58-8c87bcbdd7amr12646104b3a.13.1795513192553;
        Tue, 24 Nov 2026 01:39:52 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87353b333sm6763005b3a.40.2026.11.24.01.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:39:52 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:39:30 +0800
Subject: [PATCH 1/2] dt-bindings: arm: qcom,coresight-ctcu: Add Eliza
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
Message-Id: <20261124-add-coresight-nodes-for-eliza-v1-1-e1679ce78547@oss.qualcomm.com>
References: <20261124-add-coresight-nodes-for-eliza-v1-0-e1679ce78547@oss.qualcomm.com>
In-Reply-To: <20261124-add-coresight-nodes-for-eliza-v1-0-e1679ce78547@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795513182; l=884;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=vrGfhI/rONVr+SjVSKO84RzqNkfc3HgXrWPOpBP57L0=;
 b=dRfjGqSHxhnzHgi1TZAY+OQfBCVEQy/3fQ65U7StJefXhciFR6Q1k190xbBweZUZY7HtVMVSQ
 Vt/7STI3v/WC6m6XfNvjS993SOWQr2GhDNk8fLGfrYPi7KgIF//XOp4
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNiBTYWx0ZWRfXzyOzY7hMUuLt
 DlP2OfFtKQaLiGSz9RdR05IBDREA0oNn4klpVrAtc4sjCnyVbs+pVOc6ZgHnMbpHncUqmDcBKAu
 GOK4VrfoQOk13y5FStFay6RTMG3CtcZE4IabAujucS/bH987byK1wXMGoMWnCdqLR6b9AVdtXz5
 C5GFrX8mZGMCR4J+YB2mDu0HRmZwmPyESSHp7ooy1SHAQKcMymJjqxTGvQSjtE5NOzD9mDF3Z27
 OtQj0uwBwUEJvHpqDScO3STkioIN5OCZ+Op/CLM44pzWuYm6BwE0Wk7wace0NKczjfz/fjkvXwG
 UQjoHj0qWlDDmRch+7uuZAB1/TMY8XTN5n6kx4I4+dEJbWzRnmG5L03YYQf42aY32O3dr7Edg9i
 ixIPYgCe47HxEMvbBKqIV8pmpgCkiJS8D+K50j14l31X95lthVO3FUuUvadWRBq5IFkxiL3RhXO
 KWGEmded9cnHUllzsBw==
X-Proofpoint-GUID: dmo8I-uib8NhslaQhxWpd7h6Pbo_0uM0
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b055b6a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=iCxfB9uofQ-l6sdUC70A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNiBTYWx0ZWRfXw8O5JYBNRg5u
 YlRrUPPyOGoIYrwsV/fF9XiCl4f3n0fF0Q7UEczeHi/xOei/xUJhlDFvNZy9tpxA3uEtD1KzaST
 +RI/7WTai8KTMpQj5RQP7J6epX0zXRY=
X-Proofpoint-ORIG-GUID: dmo8I-uib8NhslaQhxWpd7h6Pbo_0uM0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240036

The CTCU device for eliza shares the same configurations as SA8775p.
Add a fallback to enable the CTCU for eliza to utilize the compatible
of the SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..23b290c097f7 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -29,6 +29,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,eliza-ctcu
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu

-- 
2.34.1

