Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065239;
	b=Do2FJUhVFENFWnlxFyhvDV0QzasDItiuMCoXHrAx1gTeQRU2zwX/DxI9rHc8hLs1rLsu
	 OWeJ3xDM1/3yfdgOgblp6DwXZS+Jqs6vTiRk8/rKlCJx9IOuMNnoc3f+VNMw7bGvaSqG0
	 w7/I1qqHGHrSjv0Tj4oQjLAXIKAyh3ka7ZF+u7NTCyo8A+NV0n9+eZXVb1v2gNC0HimrV
	 AzCpAKTHfea5Zg7pC3hyp0PWAshxXum6y/LdQUJfPyphyGIiuRRBBdvidyK1sKXtCY/1Z
	 9XOKCejEdS1vbxf15nvQVFE9at+xK43MHOSlY8mNj7Dlj3pbDYGBfEVbJEpvcDd5hfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065239;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cGY5ZGmhOXBizHed9rMQcA/AWCcPoOeBp+/wQG6MXq0=;
	b=Y4W2cw1fkqYKp8SQ7BaM7o1qL+HP2tyD14tzHCD4rKbFITc1HlKwO3cAtjNaPAWDrSMi
	 WWSgU0yTLQ9fqQS4cj1TAEzY0UwloMMW8cTKXXwy2+jn5z4Jg/gvui32elhTU08Qjjcm3
	 X5u4BtwHPAq8phOK9fDo654YZ/shFvlUHmnbDp/SxKjUNfVP8SmCPe5gbwySzFkumFb9F
	 Q4YTizFwP5JpGzfzUmW79tCaOZBWlnjada2vz6k1Txg7yQiqXGf34jcmMLI5AISBL4FbP
	 oicpxWqU8GEMUAiUwjQiWiDhNM0e9cGOZQaiL+bXmGZ5H2wxfLAtSOOYejJ+RFigLqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fP70baho;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kmcRvppD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A23860A261E
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A23860A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fP70baho;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kmcRvppD
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1ArN61444324
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cGY5ZGmhOXBizHed9rMQcA/AWCcPoOeBp+/wQG6MXq0=; b=fP70baho5vi8arhx
	Xn4biNEzc/MhGKMFJnVti07rCRdz5vNjrGAMV6vIhZ/JZkcYsCaeWovz34TVcoz8
	EVdtZcz8Befjj7BeBpg3LAzw04vnii5b8EAJ0MEOBGt5JOO+yhAi12MLRS37qh6l
	5v1MXk60Nlza8B3FLEX8UfI5YOsxWFqMldaAP2SAaqewnP2aW4KRn/VzmRc7D+ue
	D0RuUiqQi8sDrb+ISDt1UC9fLsd2yUM0XAf32MacpPXecJlx5tm9iz4lR1L6u3+5
	X1JfEYgmj0JfD9+FL/k/IxnaUzIaCaQbGM1Cy7mNzaGpVCM2kFyEoX9pWRJjyxet
	++ywkQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1e5qu76q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:13:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed02a00b24so16646495ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 21:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795065238; x=1795670038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cGY5ZGmhOXBizHed9rMQcA/AWCcPoOeBp+/wQG6MXq0=;
        b=kmcRvppDBhlyvg3obi3MlgamgMj5hQ8zRHeuMQfjoJuHqs97NMTGEcquY2heDTEG9x
         gTQ41XkDmTQpWZLc6YmeMKgSOJWwkHDp5JpyrxK8eSBSjbo1TcJKDD+6D729yU8EUQ+W
         RLKquHw4rTyNzPdhq+1k+YVI4USX9memYMhuDHzQy6uggKSNSglmqCCOIUA5bIDEvMcS
         //uD4vR9Rj4yUhInwVXbmWQeeNv96/LNz3U3VyIrnWvBzQkSGQrSdoDwOSQEp1pWRSKO
         CU3o/V+dU3owtCSGMZZu7tgHEKtZh2QQxMQ9a/XNT8D26T/tKYT2tPqRc9K/4cTzN3Xe
         amPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795065238; x=1795670038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGY5ZGmhOXBizHed9rMQcA/AWCcPoOeBp+/wQG6MXq0=;
        b=c4i0m0ogWysqvEaXaMR4ET9WjM9JIduqHPHjNuP1VCZ+4kPSLG/ufL/8OQnN0nfBCZ
         GHkQz6ICMqwEoj3pjHGXgnetJDJcq2DNzEqpQDGZ2YubSRh3vup+ERw2lDGjyo/jKv8k
         7pWO5JqgtK/02c8vzFLJiNJt0r068DoyXKXBspGyCyws1xvVkv3MciEPSlkTNh50zQ47
         Q4HTmrhYBM9eKtzVSjP0yeeTS8rKu9srESTOpXb1fDi5LGyg2gjkTAe//Y2BhXZP+nzA
         ccrz4X2qqApNVZEhfZNWDf/c7MIz4agxs0VvKkZoc1m5okby7JILQMkkbSWaurAWhD8U
         ZHvw==
X-Forwarded-Encrypted: i=1; AL+hErGUScmhV3tyuI81qAY01iE4l8WN8B499/BQ5NGw6h+kK//isbf52FZpQ4g0dbfgIr/ylTEk7WfwzrputUYS@vger.kernel.org
X-Gm-Message-State: APuU4Z/QlFYayy73cBczjZDhR4zSlBt6MTroEupkek6LJh7Wh9sUj7DK
	51Wy2Blwuv4CX/urUTrzKkz63fjSQFeA2OyjR3VaS0Wx3T0kbW442mah3dgWgl5Ez9/P3SnlBZ9
	9bpR/Pnp/6FhTo32xSPOVmOER8TT1KDJDdeD2rRqo6IpC4Wx5renL1Pw8Ld6aGZhuGXmxyjtd72
	PpsAw=
X-Gm-Gg: AZFdTZfLWisj3DZiQXU3oOMbV8PI0pfBFojDvR6s6vf2jpWtGPIY0Q7dJKKBxIiAUsK
	A47/cigfjM17emjG8yLKN9T5sdHMBDJorYzZGj/pEEREibVA7Y3FhUzoZopSP299qolzWnxKP4r
	OVD1ANmYmAGZB6sjfk/z3ohP/BlC+pLMPXTMNc+W6REkMQG4c1/D2dTHtqcCm1ZwAo3bJJR1wbW
	4fMpPi1A0ipU9uLmZ/kY67FIDqR7BnegRi4KVPCLDiEv9aanxSgMyagW4nzEJn6peBccKjEY9Ic
	1Pmruk/nB41ge41+TTi3eCmFENeepxtXNGUc+1LZuUAqCCcqS2loNwCXfmhyM8vMVRc2gtMA7k2
	fnGviK36AaJgGlAYy1yt3HGLisbT5cd/JT9KFLnfRAiUoEOY3kaoJJpZDVqEf+N94o2pfQpcvlD
	ySgPP1FLzJZ+tKRmgtckX7lVcIFYH5YHjaacA6ik9pYo7S1EQ=
X-Received: by 2002:a17:902:d2c9:b0:2e5:78b1:33fc with SMTP id d9443c01a7336-2eff768f398mr46127815ad.53.1795065237836;
        Wed, 18 Nov 2026 21:13:57 -0800 (PST)
X-Received: by 2002:a17:902:d2c9:b0:2e5:78b1:33fc with SMTP id d9443c01a7336-2eff768f398mr46127555ad.53.1795065237254;
        Wed, 18 Nov 2026 21:13:57 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622c0a5sm24067185ad.50.2026.11.18.21.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:13:56 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 13:13:28 +0800
Subject: [PATCH v3 5/5] arm64: dts: qcom: maili: enable iris on mtp board
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
Message-Id: <20261119-add_iris_for_maili-v3-5-d47d047a3f7c@oss.qualcomm.com>
References: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
In-Reply-To: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065207; l=696;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=lhLLo1Rnt29vJGWnH0QVhbx6kqyGmQ/yrLNPDy0HyVc=;
 b=Cf4U79Rz1iV0SKlFCxZpD6fjFrewyq2fm7axjX+nag+IKleAL5x1/D0JHHcfaXjESCRyvrBcS
 LHyetPcgvLOAgraKKTziPADLagUkW+XCusmO1GY0Kw84np83EX/lRUI
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: 2gYNotyX5UTo3hcLxyr7kSvCa2Bd87gp
X-Authority-Analysis: v=2.4 cv=c5Q+0h9l c=1 sm=1 tr=0 ts=6afe8596 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1_ts_jfFenCfOmJzNDUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX3CGGZ6Ffv9f6
 2byNPMJfn37Ckc0eZ2bX+hW8XaOXEzi3/6z0qXC5v8nOnOfrQ9e7RImSDixYD48k/oB+SAle6sL
 lA5LoOt24swUxgTQDq78dPGSIrkM5Jg=
X-Proofpoint-GUID: 2gYNotyX5UTo3hcLxyr7kSvCa2Bd87gp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX2DeobYDfxi/v
 oqwhe1yJxyB87rT+yNG+rlJL6XkRDtsg847ELn+Qv7c/VnQPVJtWr48wy9XlKR0TAhUX6ANLMu+
 9C1w0jL2G55Rh7gjHEqVfMTYAg2RUCzhHY7+e3Wq0E4KsRDyAnhrI1o6qe8Onp7Jh9J4gguzi0B
 Or0rbQyTHEgO84MqsfeToDzOyCGnSBcom93+TYbeqpnZhPRQofrFOwekU6kgNlY8ZtE4yhbKfn+
 Ojt5OrreE0q5kqBjFeFJGqM7eFub08uwPk6BUkMsQbC/VKafKb7UVEatdQwwF553+caA+NSDQft
 EcnxQFt9cB4+C31BLvjGWDnBja47ZIVfRNbUTDYUtwGzJC6XmUk/AAXsn2uNUZGbI2XKtKtGFsy
 p3ixb2mhUGrTh9E1C5WoPAukYDy8IVbtQH18RuZsWEXfye+jNcf4rAmE5Mn3xOKvUwqMNIwdVeF
 j0JKfYqajKhI3wTyBWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190020

Enable the iris video codec on the maili MTP reference board.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-mtp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
index 5409d0a7ec2e07f1de9becf9aaa8b92db6d33707..22d9a420add7773009f95bc37f46f5201af7ab74 100644
--- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
@@ -743,6 +743,12 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu40_p1_s8.mbn";
+
+	status = "okay";
+};
+
 &pcie0 {
 	status = "okay";
 };

-- 
2.43.0

