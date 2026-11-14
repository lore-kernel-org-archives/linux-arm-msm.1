Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663217;
	b=zfhutLoSXLL9uJVz03oMPzObgQIHDbYFJDqOId66BV9iFrlUrOQJT4Bbt7iYfkuM1r9m
	 mxeK2xM4t1H0QnRrhZevtyQ9ltALd7Popzl1NTPf6s5DFreYxTgtmiRZjhAZ4x3GCTzpQ
	 GJTB5WX/tUVBPwZH0xqCduRpYvlkUfbvL3EAPhSoyOH4uZQyVngEiPJzIJYGepmg/bBnt
	 S/4B23fkWaVK6O7kJCP2QiB9rSHjYlOJwWIQO2qg7LnjMwzeWYvyNdc4p1zzidq7aDR0e
	 LI7Q67KG+9ZgdpoLlyLJv3js7HuyuXhgKq22FZZeUEhg0zHA01QJ8PM/OsCfl+fBoYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vJO44KrOOjKHyuAfn9RvfaU91UTQC1yY5UAm4QAAsXQ=;
	b=VVN3oZVS970sMp7eatGVq4vT+jDeKiEQJ9V8dqAwmQoS1NsIIE0cC6SGCjAcvNOAWfFt
	 eEFuixypbHyV3DcGYW6Nxa5iw5ciuDKXWDNaEIpOwPT1OWJt9EUOZvEm0bd1STunluF1g
	 gIAF8YNLs2b3JeJPuW3Fc4PkujOMYj1zsTTGofuY8grtlIHznpynasXpoYC/ZtTV37Hiq
	 hu+DwWa6qoAwNuVTzKh1RlKdf8sO5Y6id5w0hxvueLLtatfZ0CML0LGJ1gfHpQzfJRlYh
	 jltNXUZAgwsTjXgli69rrQIw7dHcjM8HFwQJvVwB+MKG8SnqsOMz6oK5msvyxzQR4SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BE1oZUA4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="H7Sq3x/U";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F4D606A887
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F4D606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BE1oZUA4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H7Sq3x/U
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wViZ3717025
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vJO44KrOOjK
	HyuAfn9RvfaU91UTQC1yY5UAm4QAAsXQ=; b=BE1oZUA42W6fgiC9Z3KFr5aLwF0
	qrSUMj4QcCd80jqeRGzGyuVmwkt3sz3M8NPBH5SmH77ILW0Atf1P2O7UuQKZvqJo
	3Bnz3pcWOfqJ96SLmG9XpB91vm9bWQv3qzFiNmcZHr3dE38oWklHj9BzYG8znQ2f
	wwv+Oig8bGCe/TnH8/pEKRW1eK5ZGAOX3VaIs5c5Qh7uGb1bRw7vfETtmxR5dFLy
	d6uStR3hb2V6sojYFSE98/dawDix7j1rlQGDVGeBy2lLo7Fl7nDw5ReGzk8ZSalw
	LJ3CVwa5gYWjcaAcsySE0iA4QkJZwb0SEn86xxizWCZwM4co6DY5IXeQjsw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk20u98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:33:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9995cea88so15236595ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 05:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794663215; x=1795268015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJO44KrOOjKHyuAfn9RvfaU91UTQC1yY5UAm4QAAsXQ=;
        b=H7Sq3x/UCbDoGmI7OwGiIC3sywajgJeEnfuW47HYJCZZVDO/pSFbIwP4FsV+5ett8k
         ghdDpoy6Q28LC/RbPxRNdkBLuSIy/0paJEOxcNvljCPE/icAR6Vhp59a1eucZujNKval
         yvzzyqs5WnGi+c7/LMSl82eiJ4qbkLgsLcvYDGk5cxgVOWjF/w9vpLZejVBwAWXdQmOE
         FYolJA4P47GhPLPTyCLDXbyzieUIjN1UeHJLkO7nkJK3RGFl7uqVz2HAnX4+kSN1NYPd
         Hnzsnlh/wDDJ95j5QsTGoK3b8cBhU3uEMyxODDzePpE7aTmXSnZ4FqQD1LHMnwItz6z3
         XF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663215; x=1795268015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vJO44KrOOjKHyuAfn9RvfaU91UTQC1yY5UAm4QAAsXQ=;
        b=ZDWTG7uy7DJLaSJbHVZOH2wNy4NRbSBu4RPg6ZViMOw4zPVu6ikNNA0/qnrvXSeHvc
         YD2WyBkLfA5CMcTrAJXv2HTFglcHM106XjpQ8QvGGkhRNbPkLNtMiTXU3NFWwPedtCuu
         mGbY/WqgOL4DTaVneuZLJNt2IJLe9GGf1OhF6uH4wm3Kb1MYf6ffeQRaYylqIS5fniLT
         BF0j8HHfEnqAH7k03xBDuvuc404pGgyGKGm4Cwt/IMlTST1W++pTeTo3YkarhqrqDwxW
         +fmYlCkFJRoToHTvrlm4XN//gK4hV1oaKYavGMMSIIhZRfZp6UCaOzsG3gQEGHgZ5k/U
         aSUw==
X-Forwarded-Encrypted: i=1; AL+hErG0dojft0jKoDlQN/vgZNXvyJ+B5Pp8SDNRwJU7s282ri4SxJhkVIT1q/6uoVYxcxC1dJcZ8wo70F1Grz6J@vger.kernel.org
X-Gm-Message-State: APuU4Z80TL5chu6ORBhlQjMqfJ3F15bQU1GpmEPPnI/23s5Fk1V2wqrb
	CO5KZm252CphwM3mfNIvw+Xt8VgH3G2B28sJtStwlU16ZLYZ/L2yvBG+VDIRElhK68PY8yd/oJr
	FdyH44TRvUZ9/PcxwlclGAQ0oipicPyyU9l0PBl7YqT0vVcPjd/+xj7dWTIrMUDNciKwK
X-Gm-Gg: AYBFou3fMxOfOfB4etsuX7omWkxTtlihnE2N/ms7/04W91Dts2QXg84zYqKtO9ro5L0
	SNFsQsAwUbuTREAEFOVvuxMV3ob9e4VsPpHPQcX5wWov6/ucUvge9AhvqKWC0mYQFGZ7CdekKRx
	CJ6X0Fedc5YFfDUGceDWuD2BAeovLKzevFA4G/NIYNDLv4kVUBCWMkxVobIGbd7/ZqPuV85ZZc8
	5eemqYKF4al5K8M0WPT9uv792Sw8aax80c2d+0ani03xCUv0pjmQMAre0DQw1u/P9KJ+ey+8bPR
	+rkQtZQw7NCgJDx3zG4r4PyzBLQ6+XGLC/EznRmwqfdxbfYSUqt4HSeGQkWSPsIS0p+NwFkLGvm
	fhVict6IudD1Q1C0A7ZzLDgAP5hvebCtqepIqdcuLfqFGtUZySNOWaP0XpEfH6BdUbXdWDLd2nT
	V68qFpMFwquv195awQMq+SkiHKGJm3625F7kwb
X-Received: by 2002:a17:903:244f:b0:2e6:1828:59fa with SMTP id d9443c01a7336-2ee0de41da6mr60980505ad.18.1794663214593;
        Sat, 14 Nov 2026 05:33:34 -0800 (PST)
X-Received: by 2002:a17:903:244f:b0:2e6:1828:59fa with SMTP id d9443c01a7336-2ee0de41da6mr60980105ad.18.1794663214036;
        Sat, 14 Nov 2026 05:33:34 -0800 (PST)
Received: from ap-kernel-sh04-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8eb275sm20266965ad.64.2026.11.14.05.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:33:33 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: arm: qcom,ids: Correct SoC ID for Nord SA8797P
Date: Sat, 14 Nov 2026 21:33:01 +0800
Message-ID: <20261114133304.989635-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
References: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Vkow5NdlrurPLhMeI6FtC5BgQe-_-EJN
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6af8632f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=4vZ1Im6IUACyycUlj1cA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX2EwPMbQxkl/M
 Jpj3M1cGTkBNzTBZxW34EjejSZUEULGkZp2ZymYNMsVYtLlKenHejsdxIDNo2grcFa+3fLHu84y
 3C8F+/rjqJhYfdKZdlnGODvrzlcmVZqltlWmb8sFhvPwhkokMPH1keu4bc1DkhsdnLFeblXc6Qj
 ATqcf96lz6dB/cNqjOGx0PVI5xsY9NclcKJx5L8/n+BTBxspye4I9l/YamI2yvQBbcK8bg2f9j+
 9gePZ04AlTjqjOTdkaopNKCjVpl/Vr52JiOuI7OVTEhBlpPop5SHu8sS9vxb7baoY2Mhj5yL5e4
 OwhZMYRwEmIjym89m0j30vnexZ5+n4t5/rdFvK3GPnsT+7uf3xPuAinIREcQREpC/jQ/7g4ypbK
 q4kU2iMc0wVHjvZVku4lL+nw9gbMh/cNimHn3qCAnNtksv74hIY97jkEdwkBQfAGGuX0UWz1mHR
 pag0BcXYNDUBZHCgxww==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfXzshE8LoKBbJS
 wNS2y60+ufAWWqiUKCCdnHsm17r2w8x/VVENzK3v78vHs2OcdWO78yDDhwY3JCqp8RmnvJ94A/i
 ekLd1SuzFpEVI3IHy7kgpAVSs21wSI0=
X-Proofpoint-GUID: Vkow5NdlrurPLhMeI6FtC5BgQe-_-EJN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140053

QCOM_ID_SA8797P was defined as 690, but per Qualcomm chip info that
ID belongs to the QAM8797P/QAM8397P Snapdragon Ride module SKUs of
the Nord (NordAU) SoC. SA8797P itself is the default chip info
variant of the family with ID 648.

Correct QCOM_ID_SA8797P to 648 and add QCOM_ID_QAM8797P for 690.

Note this changes the value of an existing define. There are no
in-tree users other than the socinfo driver.

Fixes: 0670a10b7c22 ("dt-bindings: arm: qcom,ids: Add SoC ID for Nord SA8797P")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index d89d3b5dd00c..5e84c5a7666a 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -288,6 +288,7 @@
 #define QCOM_ID_SM7635			636
 #define QCOM_ID_SM6650			640
 #define QCOM_ID_SM6650P			641
+#define QCOM_ID_SA8797P			648
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_IPQ5424			651
 #define QCOM_ID_QCM6690			657
@@ -300,7 +301,7 @@
 #define QCOM_ID_QCS8275			675
 #define QCOM_ID_QCS9075			676
 #define QCOM_ID_QCS615			680
-#define QCOM_ID_SA8797P			690
+#define QCOM_ID_QAM8797P		690
 #define QCOM_ID_SM8975			707
 #define QCOM_ID_CQ7790M			731
 #define QCOM_ID_CQ7790S			732
-- 
2.43.0

