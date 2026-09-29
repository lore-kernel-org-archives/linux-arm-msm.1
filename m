Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDED3E5EEA
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 15:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697249; cv=none; b=cehBPouLuquYNAM87jtHxI3b/3lTCCnfVr9ERpCE4FvNWQDbP458tNfEVbciRAw0dPXSDiPPu4UlI/Dg37Xo8a0zGEWZ8Qk97Z/boL3m8O/PwFIpyChfnCz/gRPAUecspMrGkqJ1uAbDhSM5YZroz9YCfj9JqXR7ItYaRawkVtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697249; c=relaxed/simple;
	bh=FEmru5PIr9EHH4bmAec1XA9EIA/816JFlNZHDbavUgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DJjnSQUlYONCIdlJ0Z960Tw1MqNuqXhLZ2niBJJjrGGh/ifkrBVnISyGCBEZTAPgJ9q7cMr255e44bdEjxW7TXK68GR6w7Y6E9GoNEg9LBwIKfPMp5f1fvNjkSNIrv5YckOl5rK044RMTp9lJhirAHtJTEqydUTXyoqSUQKR6BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A27GgV6r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c4AhWbYG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A27GgV6r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c4AhWbYG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCw8qq3301599
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 15:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NpekZf1ag4X
	VU0nJOyoaS3NUzdoS3+8KgBabEKwH0vY=; b=A27GgV6rZPKmmoeeSfyk83EZphs
	6ijsj9WzZi8KoCnX24MfNw/VoND52iPgzR8M2OydQXEAfoJ03cV3R57kFihY0+BR
	B3ZRTfYXR/rNd5cQXBGVVk3vxP2GWtOwAcuqu1cnf3P82wWmAvrfkwBlpR+8EYBt
	RgjM0RNzQ6k+ZOdkKhDH7LBHTT7K1LH/uNtcO//AdsVvrcEbTjrIK1Xg0cv6Fqgp
	yyF1qAPcLwSJClr/dGJHAJGgQwIqjVV+AfBKPe3RoHmlFs0ziLRkdMKiP+bVAwgA
	uuszapncdej7ggujRqPY04cL/LRLOdyiGMLEjpWeWOIWldlzIOCliJMskpA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx0ueg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 15:54:06 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14318be7d79so847302c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 08:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790697246; x=1791302046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NpekZf1ag4XVU0nJOyoaS3NUzdoS3+8KgBabEKwH0vY=;
        b=c4AhWbYG3baEeINjfi+PdZgTYIbkYYjuu2Av4e6W1nYHJZQWCZ7Zoom1AmbNnG+d4O
         pCFvXSoyHXVItoz7uB5fA9aOHXvVGpiuC4Jfos/E97UClJjsvokc0r5dWd/RngmXn+zN
         qcDtc0eaAAIJabIuIVa/+Zycku14mi5UyD8EJyqPHNpYpNVlx+JzXX+knY3j6JXMf1/9
         Xvrmuq9GAzqlkmjvkTGK75RSxOhNjD3vU4EvHndrRRJH52b+EfFbrZqdwCBg7pO04VY7
         l9EK984TyO4jwxUgYaQ+dJNJNP2QkBa/YtgYAZIxBYuDSYMti1M7x4OMj5jz+Q7dw54C
         rTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697246; x=1791302046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NpekZf1ag4XVU0nJOyoaS3NUzdoS3+8KgBabEKwH0vY=;
        b=kjEAuW1fyEmmxFZnLxGayAy4bz1KSCnbrjodFOJ3M2CtzwIChtFLBiTK45wj0R/lX8
         Tr/WWDTtqP53XfPJVYOrx8K7ik7So++K7fhMviwbPu9ec7AyC6B2VGVy3Rt8/p9PrUwN
         SBWyDaueFHNXhQhCj//vb1UtGsyUrsRF0yjW4U2cBTCGO4ouOHGrfo9cdU2v4M/LBihg
         9FslyDQRKJIFncf3CBZexUXtW8V6oQjSwAju4BfO4igGeORI3Ef3Hps8RbOP7q/aQfSn
         0GQ9U3ZZ21XYf1OQkONnOpyg8ZoS2McbsD+6Q3GSNyvCqlk6ZBIH07CRJ7Mpuj6abL6P
         yoaA==
X-Forwarded-Encrypted: i=1; AKwUvByeUwgQHyngXZj5+Otwt1lbh+YvaqZNWTRYgxtSqMgWdaDTNE0QdIjz/s82nrqFgFt9ysu+El1mRPZmz9hR@vger.kernel.org
X-Gm-Message-State: AFuF++kWf4Xga1HprzFg+OnOzrEKQMt99bXQgHse0lMixh8lLdRw2bhh
	ynn49xxoWXg0+g/0qXXKGhWqvRI/yThpIUBWSUx2nV6r3NORMfDAvMQrqG7VLWwIB1B1kKg/xHi
	vnS9qot63vfqf23eOiOgwCHM5ojVGr6SkLqfw/uh9OgsHqmQsxuQTR0vrzSOmHvXnbcwm
X-Gm-Gg: AYBFou3wIZGY41VAhZxK4111S4tHznOPWzWDoWy0T+oJppgdBEo4/Sks3cgyAcvpk5C
	V8Spf2VbyH8jL+OOqBAeMDJOCuLgVzCzPUqJZX1MBiZSCaEHwhIs2rt/A9L1lKeFZQtyxD6FPSb
	Ph1CM/rvZOLFJXZT++p/D37NP00V4Xwf29133bwEwRKSuxPVOsYxcIw/r5eW835xNdye/RdNsGO
	rqzKkjLE9Ts14bAM02ziwc1Hm7ozykbrpcaqbUFJ3N80HumsfOX2zw/AYlcaE6qYD1pKpqCg9t5
	a9IFadWvlxyefufQ8yL/Ld46XnB5M/4WenQGLFFlCWzDUBLx6A+8puFNdl0+RiXf1p3xJbnNjIc
	QAL/hUKx0zwfc5YZXXRGinio2+OfId4VINZwWIxzionBGk3YgEKFCedZmSB8=
X-Received: by 2002:a05:701b:2618:b0:143:3617:c595 with SMTP id a92af1059eb24-146cdeb8ecfmr9842001c88.1.1790697246288;
        Tue, 29 Sep 2026 08:54:06 -0700 (PDT)
X-Received: by 2002:a05:701b:2618:b0:143:3617:c595 with SMTP id a92af1059eb24-146cdeb8ecfmr9841959c88.1.1790697245442;
        Tue, 29 Sep 2026 08:54:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c64e7660asm200213c88.17.2026.09.29.08.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:54:05 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 6/7] dt-bindings: arm: qcom: Document Nord Ride Embedded board
Date: Tue, 29 Sep 2026 23:51:51 +0800
Message-ID: <20260929155152.1898666-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
References: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX4O6m4C9OJw2V
 5BmfVovTRYrHnPnZGdWTzEgMP3EzF0bF/HuNJ8GddAGyD+sa7JIBOzSI88WVJek0g+c+6MEC2gx
 vUyVchqiLy6Is926r/+RH8e7XKueRA/5C3PgHWrmHY+UZVOGC/J9DK7koy2caD3z/U5FaXXnjX/
 i66qW+qSLar3GqY1DccK/zgXP3ubtsbaWyQRTcD0LDCbLf3X4DU626xcqJSkYg4rzr0ZSixiq/4
 SFRJ+v9r6fzCBnU5n4+riugFQPcBuKtHeg7WhaQWm+8oje/aGcfrqqLufEiqa89kgcYPyYQAoc8
 K5Oa/OJUZYndeRM5fAthEnLZTs5VsW22FL07IqWHkTey1DQjA05lGnL/LapunkeHS9PBPwcMAtg
 RfAIy9NX+JAbT3Z/PMVcI1CzSwwO8ZFXMBvQ5se25yhFwc+p3xf01UOOcXMHGjaOkPXtBTMQAW1
 xJ9WZ7IGyJXqBlNm4jQ==
X-Proofpoint-ORIG-GUID: F7dkankWLCPRmy9_Hscvb2eMVKbhPL4D
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX0KKaS0eYOUXI
 v0B3I+zJQ9Q1tEhuHDEWcLvhQUKDyqwdwr+iW+wE6XZ372iJLLpVUhF1WDtD/l5lxQeLl4FihJ7
 8QAd0MoWQL2Po0LpknRrTp/quOsgYNk=
X-Proofpoint-GUID: F7dkankWLCPRmy9_Hscvb2eMVKbhPL4D
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abbdf1f cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=pW5MDpohxpv7HydHHPIA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290063

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Document qcom,sa8797p-ride-embedded, the Embedded variant of the Nord
SA8797P Ride board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 07ef7988b068..4dbbeaa4760d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -427,6 +427,7 @@ properties:
           - enum:
               - qcom,iq10-rrd
               - qcom,sa8797p-ride
+              - qcom,sa8797p-ride-embedded
           - const: qcom,nord
 
       - description: Qualcomm Technologies, Inc. Robotics RB1
-- 
2.43.0

