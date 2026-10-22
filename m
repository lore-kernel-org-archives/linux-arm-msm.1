Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665655;
	b=z6rKu/ZBmwKeg3+aeTp49mQSa9r2qnQFjAQVLg8gdYYJ1tm9Gxs6//1iH25tQPc+CdXe
	 sX7U93wfS54UZg8umHo56SQYoawUyGUSJhiygMR2jY7IDvv6oB2hn9ydLs7wnpA+I+sVW
	 8ajPHrKAg/DQK7A4OM8CE3e3AtaR7MEMQ8ZSF7KCLaZj5Wn0WP+tJs4cl7WJ4c4N5Mmz/
	 VeWCdD5/GK8lcFZtYTNd63qDSMhWBb62Uf1d4pxu9UzV0XEaZ4JUOvCXSshdlwBhjVSDR
	 szv6yzEAPphrtK6R4fGSP4JuBReH2IHANn7D4oiTvn/vqYVu7k5LkSLq6R5xrR//twQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665655;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7YNtUwxM65oNx1GcpLtqDm1RUw+0Y6E4RLo94KlMKPU=;
	b=DPnjeifvi1DbQAYaB1gOzH6AMIIv7yCXXwj+T/uKfa2hnPfNcbbmk/LWske3R3CYZkBB
	 OlpgM3CTgz5/SjSM60y20RoCTZyp1HzAdHqLjT4Qf29/ZJ3l6LJ1oQWfqg6BKODty5yAy
	 /mmzulC4YrqM8fmknyCtygc8cjY9hRqGjeb+OapOTkj5PbzAs7jytUyopEXAtdNTd7Wbx
	 I1UZ1A0EqJjKkMjaSh5q7WxrhXrPECeU4Pq5/i/lpRoqj80dFXkVh6maNOIe2wme4EqbI
	 GSNrw1JP7aU1ImQHL37ni3lWoKZEdKRdVRAFdy+pditqPK8/0uOhs3oyodu2S/gW7jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=crAUTjbF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZZH0bXuc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA8A606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFA8A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=crAUTjbF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZZH0bXuc
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xmHe317698
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7YNtUwxM65oNx1GcpLtqDm1RUw+0Y6E4RLo94KlMKPU=; b=crAUTjbFr6+0fev2
	prazN3ntxMaB87Pkd6triQrAkPeaOHnXvqCRj+sfWcV8wn0thp1piti7vumsX71p
	p6DawZJpen9AEqq4sGa1VSsiki2qvri9TLNL585TgWDhUedYE8Be6xoeYPoW3WR4
	KTQH0/vERv7N89xddeF35zIEAnrwxtx4hi0p4SQA0SNXPw5GltkNhG14BXSHfoO/
	dFrV37GjFYjp1WUk5yNp9baY8ENT7TI/7dnu6rgNe/qcdCY5rPtFRPEetOsaJxwl
	pFYHiK1RlN0cNtkC89Z/3SYNuBMci13KujMtymmorhAFEe4bzxcEB6+pu8sXqKvC
	kxHQNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93aj72s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:40:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb1091fffso23082285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 03:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665653; x=1793270453; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YNtUwxM65oNx1GcpLtqDm1RUw+0Y6E4RLo94KlMKPU=;
        b=ZZH0bXucSdBxV5mv2SdZHz1NuO66aldssfhhznZfFMSGPcFhvONJ7VT/iiBICenvhr
         9HUmcfNOh1wqaVJZA22Tzgm2lbx5Jndl31aQ4TgjRuF6CAMQ2VWIgaIBEyqUBq65qS0B
         oXAG0FfEgBf4CkzybpFXLeSu3mklgjFZanHMeplUCgbr2/VSMlxA6spJjBKl46hQGty8
         CqOS2oAGVVg1kmRVKgdJNyyIqfRHgmDNLhDc8BKXVLQac33jY8jX9sRVpPUhErkLhHHL
         BLAWE9iZmYUXszxho15sc3GsJwijBZiz8WK13G01HzgfWmzAV4k/Lz0J7m4Pp7jWZ9ga
         p8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665653; x=1793270453;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7YNtUwxM65oNx1GcpLtqDm1RUw+0Y6E4RLo94KlMKPU=;
        b=SKOzOeInTK6SwVOEWjvp34FtzwIuxnxr9+MDO96eXjeuFvczt9LjT5ar9TdVofvDww
         zhJ47Y1fNLFm3pWs5OS0bRnR2byEOaHCBNfYP9vX8L/9Em99x+R2ivQDdnrSm85D9EaE
         hEe3MDxqQwFXiBc40shUvhSEi+RMjU9fFSsgbAIvRZYpwHxK/B6jqAsLk/v9BVVtfOmu
         YVU5fgdvwEHHSojw3kbUwMoc1GglZZ2rR85DchIghtXJoNiJ5MRajFnnWYZ9C/1zyZa3
         /B5D0BP1SN2ewyJ93nPAu/qxEL2pRTYBbbZ2ghLaXJsi8+b75BB6oOxj0UIcUVWHNiDs
         ylKA==
X-Gm-Message-State: AFq9FYJYHcUwiDHaStCvu5Ow2aBfHuKJSfocMfB0rB78euT+en6sKT9p
	NzYNvb7/PfS6uQETwBmvQPgln9LU6rnUHMDVNF3gv7+8PmHxHpuuckyL2BF/n9AEcHWlejLUMFf
	ukpJ/XbjOGulB1wMlMxBLsY9mSK6eRSTn7mKYCd8DrzS77ZM1HHrwutmO4r76aJURiQKp/fmSaZ
	AH
X-Gm-Gg: AYBFou2CWaoMzRsF8ZR6tm8fN5G2gj/9vyDDqhkXhsdwpsty4FjaAx6r0VY/RIrqC1/
	ZtBFP/TwTO/CirtllqqyT0Q1bpGD9hQG7r6ZLjobcU83RcRP5AuVWdmqpT6RGkeD4SfDlCz28dC
	rFBa7peuMFMZTrXEIB+848hPmf9P89sYgy8QbOMYMv7Qrp1xtn0jmndQphaC0UoOqtY5X5rher+
	m2u9aCws/kSoqhcnft3yqBcDWLBEbxoJta2tUz4yk9PhAj1jrMC/ofa2zdrsWH3a0z0v/o/9Hn+
	rw+bCe06fpo2p1UtISNrJNnNt1XMX3W7Syl4DY59G3QV3rkb47d+puucac3beaDIBKcgKAeEaaV
	JrgkTEUllZZtiXvdV5iyDSA==
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr1020948585a.1.1792665652831;
        Thu, 22 Oct 2026 03:40:52 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr1020944685a.1.1792665652217;
        Thu, 22 Oct 2026 03:40:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40316bcd6sm1606316a12.36.2026.10.22.03.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 03:40:50 -0700 (PDT)
Message-ID: <08503be4-d40f-45b2-9f78-27f49125909c@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 12:40:47 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/11] phy: qualcomm: qmp-combo: Add v8 PCS-level drive
 level tables for Glymur
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-6-3848c2615d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-glymur-phy-v3-v5-6-3848c2615d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX6a0l/Cxy6f7n
 DbR2PY60mQmRFldLW8xyQQWwqvBFFNG/UHnXioPmYm9Rq3AHpbrsWS453TS1uA+y8omFhRFUyhC
 JbsngafXIRBVROqG+xRBO0v4BhPoqSB9US/8hLl/YPxcqVI3fyQN6UTx8zVSXe9zDH7+ItinSJ/
 iLxQ0i7wqnzA6WG2cQaYAIp+oaoFrHaa7fMI7YYrLF9BHPoNQA2Hb0pYv7lSocCmPtIbmkJqlry
 tycJjEuLOxFvrE0SN/e0XRBBGsZsEe6PRd3Wb+4UVlj/Gg+xWqNaN/44Oy1jConBis3tw7dSHvw
 +CR8iwqqXNCvWr7TEls77w7QVCCYuCKDUxJPmVOJdTxsxoRCEWVxJMShdnPMNBwydhNks6SZsxa
 NXzAaTyq3AraXooxtpGLd+QgEHTv7cY+SzszhVe4K0Q9N/e//cWv8d2RPQdnbeX1inrvX1eVqpB
 JlirKoU5Uql115lPvDA==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9e835 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=20IFmG_dcDsSQBPH43QA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Ilf7mE0AbX5wx5IPzrDXQ8QoK-cF0vkx
X-Proofpoint-GUID: Ilf7mE0AbX5wx5IPzrDXQ8QoK-cF0vkx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX2x7he9dhy1Eg
 5oRUPwaEKmZRWI61rSREVkZEHbqAc2lhIWfvfBYCGMjN9ZdrHOU0tt7skxkWU4Zl3Y2sxNXiisz
 z/Kio0kSmFeRQxbWiknyKrb9IpTIB5E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220042

On 10/1/26 11:34 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add PCS-level drive level tables for the Glymur (V8) DP PHY:
> - qmp_dp_v8_ln_drv_lvl_hbr3_hbr2: LN0/LN1_DRV_LVL settings for HBR3/HBR2
> - qmp_dp_v8_ln_drv_lvl_hbr_rbr: LN0/LN1_DRV_LVL settings for HBR/RBR
> - qmp_dp_v8_pre_emphasis_hbr_rbr: updated TX_EMP_POST1_LVL values for
>  HBR/RBR

[...]

> +/* HBR3 & HBR2: DP2_LN0/LN1_DRV_LVL swing settings (PCS level) */

These comments are a bit superfluous

[...]

> +	/* PCS-level drive level tables (v8 / Glymur) */
> +	const u8 (*ln_drv_lvl_hbr_rbr)[4][4];
> +	const u8 (*ln_drv_lvl_hbr3_hbr2)[4][4];

Why can't we reuse the existing fields?

Konrad
