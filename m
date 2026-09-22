Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4B13F210C
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 04:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790051644; cv=none; b=pcGCO/U1zI2x4tZgyrbzKN8lTe6jy0VqjXveX7A2635oCI53PLviYIKj0haB9QDmINqGnvAZJV6CxG9cMtgJIGiYtzvGUHmXu3JVPRdRhyzJ7X1cIiKPkMNW6cZbkqMrcNuBGuNrWf/ujh49sW2f74zDX9oPEFT/g466n+KQ4gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790051644; c=relaxed/simple;
	bh=WVV8y+rcjNFnB4LguK2GR1/TdwXx7ITLp4kAjYB9HTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hKkZts5MNsUvkgiMKa7AXLd5QtUAMQiqaI3kM6X4PhZd8herX5bHuFXJg9D5hzl/DtX/ro9F78b/XVAucYo4Kl0bAI0IspxAQA5TNWm+X5g2fP2bfezJjonPNWpTsVMJw+1WjaRhaMBs6Tudgp09x4ZOsmGSAOmEgPddZGZmtbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gieDcc6m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8QfadV6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gieDcc6m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M8QfadV6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M0F5eU3186661
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 04:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g2ZBm74Yk/Koo7aS1h6Sw1CThaL6RiYUvVn32kq3szE=; b=gieDcc6mprH9oWzA
	QJEYFa/Xl61jZDFJd+deo8QUOYCXKpXe2AtVLQ4uPQYt4LUqUZufnWvwh/Y56WSC
	WoYihXgTYVpQZYqL4sypS+QLC+uiKHcgdV3zTA5t/giGF9ym7qAWqpQ7yFC6ZYxu
	llLyB1e3n7f8lAlncbkz0sgGuLNlgGDIJWMBZxnb9AiNmxYm5wXfAEObPzeIN4ma
	8Y6RsONpGiFh5//d9TMenGvctA+T8YDDlw3IlwO4KylxBcYkA5AAY32ZVM/boVgG
	BDe+k22z6ZFNS1v87izVyEIeDEqERM14y/3YEqjXfitHbGK7iH8GJc3snMd9hB4K
	1uY1CQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybgsa3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 04:33:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc44d708055so1392660a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 21:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790051638; x=1790656438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2ZBm74Yk/Koo7aS1h6Sw1CThaL6RiYUvVn32kq3szE=;
        b=M8QfadV64sEteaLZkZEJzOf7w3b4jNMOvp9cFVtrZZxLAsfJsCaX3e6hJ+BMNLWoKk
         hU4szbm4RPrlb78LC57Y9IcnsRqpqA3R6O9rwZhAj0sch/1zbS03ZUD4Kibl38H2CD8N
         6eFzaAh2VOdOy3WHzMulQx8JlIuk5PEpdFo8lejsBTimG1UpUy8P3uK9OC+nygSlV3VA
         fEtXgr+j4OcxopvBwG7TYzreJaD24Cbdg3wTHmxDRGyL/LNLeDbTWBVMmYANTETpd8Ii
         aiMN/CajCADNvwLmY/+VIb8APjyWHy3+2RstIwBBfNjk8HPTMbooTZyIELyUCKNF+6EA
         yjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790051638; x=1790656438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2ZBm74Yk/Koo7aS1h6Sw1CThaL6RiYUvVn32kq3szE=;
        b=iuzBa7KRjYOjdBM6IUQn4zXXfQXYVYkQejksetX+IpKR2m5/U9uKlXpA8EHM/IIrbZ
         KIxHqYP8J70NEC3yaR6Y28Wc1ECf0iribEY8s62ZPLs6Zzl9sGkwmPxB3uPfIwLfNuWA
         y3p4xChsSo3pGvEQIqTp6ZDrKD0I6r7g1+4XvmhRx0XlkIa7BILl+Be/dngYalaKmJ+s
         p+n/meTSNvgetjE2k2PsvTtfNOHKIoCEUqmqBQKH7P5D3SKAaaHEIE9dZhOamjl2E0ft
         8zKLIdCCW7/9aDMLP6VdhCd9z25agtX2N1xLC2Ke9yh3OtCKc2P7NlTGGMcCGxgMBpZx
         +j0Q==
X-Gm-Message-State: AFuF++lOK7jNsYnZWtrHz1jsIOZHW3k7RpLSHMK7/NPcU1SZcFllpj0x
	jRqwwmuP6ObBjXPl3oIqm+/bMBYLeWOm3AOC58v2xUiNJo/fKRiMwm+PjPhnjpzpg7ZNHkTQy7K
	0s1/SRPROJmXWt9nm2XtmQiTCCE1zlq9CLRaPWUhoZxFkTiwd0OuBLo1iu5iqqWUPQbLO
X-Gm-Gg: AYBFou10mw0Qe3dfxLuRzD+HaPiOdnu5QxqHx7VwRkaSmLsykHATSsySIe9DIVoydbT
	3ddlsiC7vXp1l2fjsBRP7Bts8Z0DTZBc/5FVmbGnYnfPv77Pfd89ClntSop6rQIYoC8AiL3CpL0
	pZ7CyFtTMp6r3EdRdD+FRfUy6BfOGMwnYIagQchO0rYNtmvnweLRKau26m2hg2Mkm/zhsDWVaM1
	cIVG80ylLeSI6SdsNMXKUyZJ8aEGRSP4rS/zkeKQ+hOW1tqIVwIlNn63xcpgPFOi3z4yx0oy9UO
	cmXRwb0Z62zywL+R1Ld4+yNlwYlfUFBVgorikroDipP+qWfCuRXeKtarElIV/FqndTO01fWB+fE
	x3/FfkLMqqL9ATaHN+khNUCHkgX9D0myVLHv2gWpfFHUbyZmtthQonBzfxxlfOO3LJ1XcNA4LAz
	i7DRoVSi3LfLN031B5DxXaah0ApGL1C9npQM8=
X-Received: by 2002:a17:903:124e:b0:2dd:c100:313c with SMTP id d9443c01a7336-2ddc1003224mr123612705ad.56.1790051638387;
        Mon, 21 Sep 2026 21:33:58 -0700 (PDT)
X-Received: by 2002:a17:903:124e:b0:2dd:c100:313c with SMTP id d9443c01a7336-2ddc1003224mr123612265ad.56.1790051637903;
        Mon, 21 Sep 2026 21:33:57 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129ad40sm1906375eec.12.2026.09.21.21.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 21:33:57 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:03:16 +0530
Subject: [PATCH v2 3/3] cpufreq: qcom-nvmem: add support for QCF3211 &
 IPQ5211
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-ipq52xx_new_ids-v2-3-4b1a0f3d04b2@oss.qualcomm.com>
References: <20260922-ipq52xx_new_ids-v2-0-4b1a0f3d04b2@oss.qualcomm.com>
In-Reply-To: <20260922-ipq52xx_new_ids-v2-0-4b1a0f3d04b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab20537 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=y-kxD1SJUMLPT1neuUsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 3ov0XuqWxiQWiqeeD3YprjVveOGigDha
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA2MiBTYWx0ZWRfX/8BVSVE2e/3s
 ry9qDH9hf5AYuQ0tJsIhkIo4Q9eLateQl6GnJiLiLNZKBcX8Qc/zvpHwL/EMCeGWIG84VmmBDlY
 h0bAa8G+zrOhIAu54XF4sh1ZbJ//JeWcxeQCIcl3f/2lU7X6pqSY4IIEELrW59nljmXHmnXQcbP
 otmgP3MBfzU48YRXAUrY8f/QlHGLlHmd/K2p5mVSxbYMo/gSYMKK9UdJRvP+v/ufAU06yAlrfse
 T8bQ7Id8POcJg159P+fBKCkSjkWdZrODj0sYyK/a6WyVSnT99P3TbvQ3BZd6S1LeJwOt2rlqS2f
 zXtv1eiX95Oq35Zp2eMAj7rNZ6N+tQBGlF+SBDOIOHaWMR5F4S6ZMy8+TTE/smaYdAqwAz2YKje
 nQFjlLwZp0uxRaGMmzpgH4LIViY1mhDPNobzTqGIO+/wru09wvpHMsAmtlKzZIx0TMaG55mFd1U
 yWMFkhO/BONr0+MKU5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA2MiBTYWx0ZWRfX4nzJzrI9YfNY
 H+/sHm8vYe07NP9+ZQ4zfGJPNLvv7sq1a5ZnLZ1HPu5llnuSYmElLisMTEB2pfybpVn1B5xhxJs
 03LF4m0q5zdDFlt7l3TnBRFX34ec3Ug=
X-Proofpoint-GUID: 3ov0XuqWxiQWiqeeD3YprjVveOGigDha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220062

Like all other SoCs in IPQ5210 family, cpufreq for QCF3211 & IPQ5211 is
also determined by the eFuse. Add support for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index efa766e98d86..9f2e6e6c0905 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -205,6 +205,8 @@ static int qcom_cpufreq_kryo_name_version(struct device *cpu_dev,
 	case QCOM_ID_QCF2200:
 	case QCOM_ID_QCF3200:
 	case QCOM_ID_QCF3210:
+	case QCOM_ID_QCF3211:
+	case QCOM_ID_IPQ5211:
 		drv->versions = (*speedbin == 0xcd) ? BIT(1) : BIT(0);
 		break;
 	case QCOM_ID_IPQ5424:

-- 
2.34.1

