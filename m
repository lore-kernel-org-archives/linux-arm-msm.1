Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328768;
	b=qtGxjCVICHohFayXfjSWD5iK66M78myNYXkq/HnJbz2EsuqJvQaJ7y43jegmkpDcJGov
	 A7UbBd+/KMVhlwWzKVsfaMLCMlMm3U3KH6Kilc/F2AmEtJQvI3N0igzq7QvTvaAfLUmN5
	 3VxXOF7/iAoAOuQhsqu5F8eOjmC4MBygFpQ7KAJD57zlBfawrVlDN/e/zo/MAAI+uaOhQ
	 Sjm0dNqhh6RgYMUWR3ZpN2u3pIBOSZ4r7k5zqcVlvkszmKipPTlmR21qeKKYgXNvLqbQi
	 G86xAVMVsCeu7j5QjCbX8z0mjHveXFQoy/IM3YyzOnAukfKyi/nUYoBVjfzfDyokJnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328768;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
	b=HvtLevPB+nkKccHr4fS9zx0WIAHHUN9auc9jC+7CiyTFbBTjew4XCA4ttXAIgqliZetg
	 Cg5mKGQzqOiAr3j7iqUyH1J+9NISpPQX96dD9ofQAACPIrP11Gn7KBAFu97mD/i68Uugz
	 9y+rE9iTT35eEsTziiT7vQ3O2boHWH15aJWIBuJMQc0Ijb25QIwYeTey9SdGC8DOw9akX
	 buSVeA79C+8J8/wubw0aT8JiLn2OPpjYughUhyuRWGUXKmsAXqN9p1X842OBSXMy8G9n7
	 XsW29gr1bwWkOPv52+vEuGZ+YpjpzPIa2rcvTt66sSPVfGVltevwdXwThjYcU5HmuAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="B/tGTLUl";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=POxdAeS1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38204606E812
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38204606E812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B/tGTLUl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=POxdAeS1
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0DP53713634
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xtBrngpMGCe
	Q6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=; b=B/tGTLUlL4K0hJ1Q1MWsk7HzHGo
	wLEaG83DQtjsmlsenGMR46YrTnIVk1Kakl9QDejjuxd6gNdon+MeSim9TPrRooxF
	RlETV3dDdY3HrJKJKRHOeUyNui3JqvWz7VwQbBtYakjHBbSeweQqnRoRyhoEqcWG
	kv2syDYc0DOKLqRZ2oM5oOi20vEjOm6pyuoX1GY+RzqmYIzkpmy2pZ/zcuOhwDTn
	UIjkXNKZBTZeElsbQfh3AVzL6FseFPER83WfLb6n41Mdiv5aFXN25kVcpXfI2F2g
	7xlHLk0NAeIc5hH/UsfbeT1Xx7E3ZAaITl3Tgm8g7YKo+RAMQ3Ky1FhhuIA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtdamyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc450e6dc2so1898324137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 08:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328767; x=1794933567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
        b=POxdAeS134a/bHTQP67miwPT7SR1ie8Rh3La+Ea7PL5jU6v/4O8mLYt9n+Mwhnh7e3
         XxR5xnAsgP/reK2x5s+L3pmkis0jjBU9nJcfP1byfMA6D5HGWY4rmZqhGirrLq3kLJXA
         EpdlfAoVE+0rAbt5655CBK3sSIaRguZekV3lHwLjNnOaZAuYp+thbs4jO1Cbfa/0nhvF
         If5H+rkcsv77MkPMrJmEzgelAKQG4+FU+o0MH+cgiuEqMCqi93qIFqw0FmLmQBVvud2n
         j2kJvoglStuUBbnXOKVPgZ4A8GBjOG9Vz1L4ekRSvbOIVd6IzJfK+2kok2lf15rFgRI8
         EGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328767; x=1794933567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtBrngpMGCeQ6vCSEXy9e3E60S6AP7bfg0Uxum5z8t0=;
        b=zrMRRcDua95NeWRZ4OcMzg+nkETjUNj0CR28ESrhAtBX39QehR3jZyDVv5VHY3lF6F
         y+lzocynbR+5YmNn77zu5MbgmL9LbiSBWSFoWizE2QNxU5JnBZ/JvbITgFyWmwZCc8XN
         RfvoZo8p4t7sm1lN6djQyhJaEwqhvXtU0yvtDvpbIp/NMbxzInm1uLdf4Y7caYNBq8r3
         T0VVdbe4beYVQ/LPO8kn2lH9Qrsxn/FYYqa0/MOJsL37U44Y66ljNF3F/seUbsTnHEiG
         TZXW0ofPQaAkxKDFj5C/mAgQP4p0kOvyeFkJyVPdZaAK7QVr6BMsjprshgcvQhJfRWN9
         65Mg==
X-Forwarded-Encrypted: i=1; AL+hErG1q8BKhyJDJu8peSiFroXuZULsMWrJ4ItGy3z5twCxaHIAYSJeBIgGLoTfEwz2I0U7U5AGw2sT9yF/FggC@vger.kernel.org
X-Gm-Message-State: APuU4Z9D4rzSCRRqD7rD+HFcHbhX14yYtcSWJh51bigc9Lgn3D2egXlI
	1uelgSQ2Bia5i2Rw/VnOxQvmPThgKzE/ll32D11i8rpixFr3yapyx4YzcU6QoOUEbmqZLbffXAB
	MAG6Z5Th8y1IQ3l/vIE1ZAdwUeK4aNtxw94DFAVeh6iTmx76D0bh0ydkdQ7Pt343Ilrth
X-Gm-Gg: AYBFou2xwsPGV6std9hW6aWADnxtopv0HYcEVTeMSyY87cFge6a0YIw9ItZal3vPkp9
	hHQCMzhpoPX/6ZTXClOUcZ3/pnkoE2FdeITXE2tW+xPICEVvrCWSXKruI7619LfDEatEmSOiSCe
	ljyYXPRdyWAsbEMHh3RdTb/RUyfL5mP5oaqqvuE+Riw+wdyxUkO3rD+gcjxNucrWvXGUGf2batO
	eCSJrNCNy0HqO6juaA+Ces9Izi/2dd/MNZSY2yY4jMnfkv9m7VHl5NdqVEBoMXQp8KHpQyYFrwu
	64Tmp70tCW2pYcmYPMQMGlcerXBzBWRuekhkIrggteL9PxkO9iYwV9t8MUCfFqkm6nN6tJJ17bg
	5VDzMl7TK6VQlPqdrphSvYq00y2KNaFkty8aNpANLbCdMOD9mD5sRtYxar1iykJsMC5sYlhYSPA
	==
X-Received: by 2002:a05:6102:3910:b0:7c1:8aa5:36c8 with SMTP id ada2fe7eead31-7d301c3ff3amr1254815137.36.1794328766635;
        Tue, 10 Nov 2026 08:39:26 -0800 (PST)
X-Received: by 2002:a05:6102:3910:b0:7c1:8aa5:36c8 with SMTP id ada2fe7eead31-7d301c3ff3amr1254799137.36.1794328766120;
        Tue, 10 Nov 2026 08:39:26 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:25 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 6/8] arm64: dts: qcom: qrb5165-rb5: Enable JPEG encoder
Date: Tue, 10 Nov 2026 18:39:07 +0200
Message-Id: <20261110163909.78085-7-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: 7A0lWGVvYT_iF-y3skxpWLIeMhzwF7i-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfXxquOWPPckYrl
 to+zeuStUOO6lZf2rPh38VjGHL6aiPyR1Cgn00arNXv03K68q7G8gKcwtrQ3I+KBDBRZysxuY5/
 vvSP61g5entANORpVXYlAMvbxdRNPuE=
X-Proofpoint-ORIG-GUID: 7A0lWGVvYT_iF-y3skxpWLIeMhzwF7i-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX8e0QNR6QDWdP
 jsXPjySyd5DGcCjMeGVz7jNxcUwqePkKj/pOr/JlZb3tfvCat5sXuL/z7rwwGuULH93fwimcX1p
 F57XdeOdF3YJe7b4rPbjcntThtmSdR7ItrdG0DspXgVxpj4Wpm1B7gkvgjl2vhOA6CLD6dx7tWI
 7frOyOjFWH+ofHnnHnk9oNh1dgfvqbZsdx9FPqOUF8RTb9YbWzhzgxcOZgqeerzC0EQfeM3nnP6
 lRF/WLKjpzOnqpn4nNTKNKsKdKJ/Yzfjgv6go6+/BpoSM2rqWvlAMfeTa3RXXswBMwjwcFgUDjp
 sEJCnGGkPBOHH4Z3iUVQZcdlviH+pdHFKaDa06Izgr7PC8gJ7t/EBTHAoWYIh5DI9sl7Uydovpp
 JE5vQFiWxKnGsJGtlEgK9k+u+t2QH+3LUamxOu24kciJemCY7gxCx7UlRxLRZkNtj3+WCjgYcMq
 +EvXf9h2Ny8qNQJPI3Q==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af348bf cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=YFy_RbSkoLDF6nbOkSQA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100066

Enable the JPEG encoder on the RB5 board.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index d6af679abe1a3..949328806a9de 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -668,6 +668,10 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&jpeg_enc {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };
-- 
2.34.1

