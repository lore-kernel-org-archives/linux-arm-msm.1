Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2B346A602
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459884; cv=none; b=Z8NL8AzW5xrPVz0biTC3pWRxP3XKGVJJBDxj8+wQCXCsJmuL8bz9kEaenwTtSHSpvb6ud5DLyKT/RgMYl4tUJ9KmcicYRHLx6l86MTFO84/FKwRMe43bNVibl0kWzcrLPydbDVgi3fEIOi5agKvgD/ZFizYoyNAS6vHfE7cOmJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459884; c=relaxed/simple;
	bh=95bc2dL3j7zvq8sUrPF+9bW5u8zLw6OG/1joY1aHH+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bxbHR28d33BQ5glRdtfr4Nd5s7QLZCxEgtVl5HZuAD1GFgRfmIVwqLd4EKii9OVPnLjlm5cKZiPC/ZV5w11nKKRfJZFOv8edif8/9sQ5BLL4bHgEGYw20CEQ6ol/jE4YgpPTuKJNvGxLiZDLPvongDA1B+BCTm4JfDieTACbMrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwi/azVl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJhFv0G4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwi/azVl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJhFv0G4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZBoe2983706
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=; b=dwi/azVliZVgSa0O
	lPcr/d3/Its4D6WIkE+zrWZhWONfpCzzyY1p5QPEdV3vpDIjY+GvcEQZVy73s69f
	93OMamrRWINQ3hxecPRqxs+YIOzNKEXfI5nPpji4jo+hXWuUtGUnctrLmceer19L
	XKxEL1hdgYbUz6+cW05duHvrWetoYfzU8I/UtAOIhpXobSaGOJSn80tedhbdqgQL
	45WoX2iqzKprZa7ia6RkBw+SmS8OsXjFZ0jXp/QKBRkwxnrTZA7Au/SOlJx7+7h4
	WPNkZNGc1ngccuhEnt5pl67CazBrjJdta2XS5Iw8dRcpigakPV/iftI3mzn/G2h3
	BJ1sag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpnet376r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:11:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f1847fb9so488743585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 01:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459881; x=1790064681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=;
        b=gJhFv0G45ZPQGOWRJujt5ewrgGQlBCQel/rrmRwFh9CrWmw6x8tqGa3nDad7sh+vED
         E7O+jLNd9VnXiDHSdfwURNm9coOK+NLBwhPFRSZvHuZWpDYYkoTwLIVGlwbTkpBjI1wk
         QOjIHlJI8eKSjFA/izX07tyqOr+dMB7g6RnSDGiAQCM5btKvRPMvwFPCFVnItcPxC0xQ
         1ksvq/hk7I9HHy25SKHdmnt/4qAug+RlhilCXq9EaNjtqT4eVupgKNgi/qmFK9ncl6Zw
         ntrXKx6K9XUY5HCwKdTUBRsgiXKdSjqgmE6DEezImdD22NZyE9hofWNUi3J2yud1MljG
         RfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459881; x=1790064681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=;
        b=e8X9c4g9Hm4oaWBy1LP2RubJjE87i9hEGEfsP3oNxNyP4zA1QTeze5HMOFt0Nn5aoA
         iLlI1t4EsgGn7TK+VXegeQfek4tkSzBmCp6xEikEZsVxDZEXhrUpL99JYnyixLjfltNM
         PzSvA3PMfytwJJDKzkYTbr46MHLPXa8DY98VE+KRgT5m2bi57seOdP6G15ey66mlojCN
         DpfBgyjGkjftl/Tw/Rm2OXsijxFbC1VAT7ZJbvndn4ZA2VaDzzUIX5PDE7hzMJOx9+vL
         N1o8pkxJ7iDmP4bT+Szp1Z5BC5rJgI9wUPZGp8YXh2KeGmv8PfzzW1P0A0hqJ8H11ea6
         N7DQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFdpNua8Kcdsi5dd27NywJPtSbYwvqD1JE/wPVkLcOXb17w0Cysjj+OUtLSXfdajJdKm+pMRupo2FLtesM@vger.kernel.org
X-Gm-Message-State: AFuF++mATvT7avEqp2lSD8l6/zW3uE/FLhg4g9Izd8/x1LU0E+Cthz6+
	/Ckw0XlV66EBYao9SgT5U5GG7C+8dR/YFBAcP4KIZFhz0nUJWc6chHSardA3DhaxJkoA/U33hZS
	rQWQBxbLD4c7c/AzKZbOaQaRDGzvmyC25W7D8QNFKk/cgYqmCo7ivCN6heW94PcbPZ3ki
X-Gm-Gg: AYBFou2UHZmYkYoJx9FBChYF8tAIuw9gV8sIU8Hr/mOjL7//RfcgQ2416Ep/jpHIAlo
	e7he6fXu3ex6VAtBNhAUCg/6QwTjIpVDk0QYVxWofcS1i0CYyMqb97l4gLfHkwtKzOvyab6ieGT
	9KV0q0QxWBrFAcBFX3zEr8/eYtRpAtNKvAapYTEYOQZhd74PwlbYgpBiXs9Tuh5gKmISO1JixyK
	LaeMeFLYxCGflZyOQE8gKvpAIZNPJucDLdT2ysG/wYhoI52W3kS0fSE0HHS1U13t1Czex1U4KI/
	wHZORZTi0bC47Jnrz9k21D5En6TdP2pUeEFeZ6+bKzq3YXefktkqLJ9N1rwoZI4sz5r3b4XIqo5
	yxNYhCe+GnBnadoxPjW8tJMA3wcUaMgnG/R5kGZrqQ2jAglNeB8zRSW9FYklCQvJBLNzANSGJBg
	x6qP4vTedcd9/dl4HqDIhbxErYSABdzDs6y+TB6eS1bGg/XL+ge8o=
X-Received: by 2002:a05:620a:6086:b0:93a:1b82:4966 with SMTP id af79cd13be357-93a299fbf2amr906736285a.38.1789459880945;
        Tue, 15 Sep 2026 01:11:20 -0700 (PDT)
X-Received: by 2002:a05:620a:6086:b0:93a:1b82:4966 with SMTP id af79cd13be357-93a299fbf2amr906734085a.38.1789459880580;
        Tue, 15 Sep 2026 01:11:20 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:19 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:11:12 +0200
Subject: [PATCH v7 9/9] arm64: defconfig: Enable CAMSS OPE driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camss-isp-ope-v7-9-77b13d131d3d@oss.qualcomm.com>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
In-Reply-To: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX3rISA/WFvJ1j
 8inDvRpLK9Xf8+NjefeACzLyesKTuUlVp3mnDwkJLcp5hpCmeOI6G+OQ4AWAzgXuKokun7nVmvn
 94PjmA/xPWbLqHq0rjvBJQvXulOPx7M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX6IPEzUnBtKDD
 3Ag4EGWAR3i6K+TOdOhx6DfwtAc4bYxX0IzqtUrPjlaChAhdCjcVU7lZ9zSGOXsNy8Rtgvz1hkI
 ocXLJpAgJiXddtdhAmX3OdlbIsHjSmbfUh9HjfJXFwXdl+jzpfsn0hG6kXNvLqbj5lvBprblc01
 RDIGHHqlcK4FUGnc/A7H1IUQ+ooPShaxnuyDgg4YKM/4CyhRY9mudnnYuYTryf7azi5Vej38l+t
 Nbx7Cvz2+AtFEl8jzNC7LmKS0cK4t2lx0V4VsLpHE0gEIHjM84Lqng6sud64jpZBbruXIUbjOqg
 BH4/HC4FjujSe80+wv9SsiNQ7fkQzHF9J8NcS4jbccpHXgQNgLH04taIOjDf88oKgqtmyAfKlRP
 PtikP7Z4HYYr0hpfZO52G6FvtU+BS1rMcaBW+wvhrGsiUIOB5jkxEAQ1UOqfFkrX2u6nwRlzR2s
 b481F3gbe0A4JAXGujQ==
X-Authority-Analysis: v=2.4 cv=PKKaavqC c=1 sm=1 tr=0 ts=6aa8fda9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: VFhoXNhFQM592aP9UecY6OwDe_AYoQXJ
X-Proofpoint-ORIG-GUID: VFhoXNhFQM592aP9UecY6OwDe_AYoQXJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150116

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Offline Processing Engine
driver for Agatti and Shikra platforms (e.g. Arduino UNO Q).

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..604a0d58521dd6a1df8718ea3fce28cc727a08a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -931,6 +931,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

