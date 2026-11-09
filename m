Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218903;
	b=d/GTR83zYgFd7tEgxpRN4k7Cnz38iAZdG3yWl4+pnbTyqHiu2RoIj6/mJb63UFJHQwgS
	 PaB7Cxknk9Z066RpLhrj+itEt0fCbUQxhZtfFeSpfytqlTUMUKxdTF0cC5qOVKxgRDPUN
	 G3X6PAqAG6X9G2jZLBUdcu/iGFFAgL9jWNENgh6trA7cEmGVm90M8rSE9vXKBUpL3S29u
	 qyDCJv6k89aROfdJ18OFa6ST5r3DjTu2e0KrjtF0furvIsIjIN7jk/UYhiiMKJH+Vw0/r
	 664n60z5kXKAT49gfP0OXR2df8fHbxJVxB+fUvVyeeNLBHE3WFkHyBG1J6SysxF8viw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218903;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jEMwXoUBBGwYTnnF99b0m/OVmdHCRRHD5q+loVQvwZ8=;
	b=EoghPrPzrhe/vwFL3hvvXf3C3eu91yUhIAR20IWkODT6IvNakED2fpOlzUyODkl3Qipz
	 6iwTWZJNj9RmDqyGbpqo6zeZeimwr5OLcq3np5cNR3E7OFu4gXbH0E4MELHTmKR5xEdEc
	 /VvVm9zA1RPSX5jH4L6TKWCE+dOE2mSEj8112MbZvD0UaBNmHba9gC4vkFhRKnLvSSQ8f
	 B342slm8zkgprGB42sPxkrKyRnCIvWBNxW6Tp6dSdMRgE+QR6xk3pM1u+8x07QbswDtUU
	 yPqcnQQV/o1cCwxJTUGkO7SLil57xs2vpMmFOTrYHicyp7LuJe9jExIdIWIu5bFamzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJyZ9oK9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vwzal6ou;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075E7606D810
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 10:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 075E7606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJyZ9oK9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vwzal6ou
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99v5BI561998
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 10:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jEMwXoUBBGwYTnnF99b0m/OV
	mdHCRRHD5q+loVQvwZ8=; b=BJyZ9oK9jZbGrmHTJ6h0dhcKcwB2wVnR7DJWmapp
	cFt6kssBl83MnPzGtvjnVWvXx0G2Eg/jFmluQs8GXbha39cXQ7BVcRif6TqcdPQs
	Hd1d58OZqhu4PxLiYmltxEpSbmp+AYJshZmpNht+DEqtd9rtR9zdNv3MEipVLbou
	k3QmnDWSjzI0yl8121ZOLSUV6RATbNh0NqINv3S/e3Qf12dmLXLFAPg9g/nCiTBv
	fl2ApZwcel7+d0dOpIlo++2m2RJ0Rv+IO7NCDUUvElUBgmJuO75mSazM2vRhOtvq
	x0KiD/6OrrJloLwd8feUwHAew/74SKqxgLr2rbZBceXx9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxdvyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 10:08:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so76739685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 02:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218901; x=1794823701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jEMwXoUBBGwYTnnF99b0m/OVmdHCRRHD5q+loVQvwZ8=;
        b=Vwzal6oucKiKqcCTFKffwR5lEq9Hz9D3bE+RtKHObvKkv73vWSPq1QUuaskJtYUcLI
         0Ka5HqXBn0RUvmP8us0bk84uVuklPQN05RV/PTn5xQMGry3bg8qghqsrffeiME2WYlzq
         WBtPlaCyg7y7Vw9dL+lByDBM7Se3fG64QqcNVyJN1JTtYR20lPKXEsgiEb1zBBddr3Ub
         cSzqsU08o6I7LSAGLn/BrXb5fc1AVVlnoNYlYiW0otZT5n6keqLkGBnDdOq1KBSWinY6
         OB+NiyFJXU3a2a6bQ2VKfmPpPV7kJbSSDI+hqwFBYAfAk5CQ3pk09zR7gvHMlaeO3F1q
         U6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218901; x=1794823701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jEMwXoUBBGwYTnnF99b0m/OVmdHCRRHD5q+loVQvwZ8=;
        b=25kIK6rHIOt3k5e14DhJRCYB29bZ10XAYOdBLjNOcBzoc3MJTvWNb+K9LN+AKkTxAD
         h8baFDBNFeaFEAnjm969BzHFH9a+o8Z00RnseVdrv9F06VBnU+DuUhYWV2A2TTNZPSZv
         nnTQMvS3xEJUVFtR+uQhccyq3YAsxCxgafkrHxPGwnXFRf4vA1VmR0BX9RrylM3J/c/b
         QNoJkFv9zlG+Gj4OLkVIxqGHrRUZSKXZ1MSdIVwFLuKZGpBjyqGidwDkmg07V5o2qlg7
         GJ9FGgsd2UUDhAVtvmD2WcpEIrsxhPwrZIVuiBzkZ+6ltnVqUAsOliHZVOuHh/msw3he
         DP7A==
X-Forwarded-Encrypted: i=1; AL+hErH/By00121kcBIHtRUKA5etrb9Txol9oatDj1pj2Dk+52BXw0lzSLI79akG+hpGdY0XGRpGycMXHnHgJ3Zc@vger.kernel.org
X-Gm-Message-State: APuU4Z+5tkYm95DKY+ZPzKOifEHh7uWIEVUjQRV0/H6TbZC5S44sExaK
	Dwt58pmWXBfg0Cw8ganRvUdpBUElx83EIdyjDfeLDyxDiqPcj4glboFiepntPzrKV7j+jRqi/n8
	nT9aWlWgepN+cSWPg2TnWIhfSHsXVMu5r3WCDz1lEJsHs7fnAzukqbH3FcAoHlMHGYXzOb1XlbY
	WO
X-Gm-Gg: AYBFou3gte9EywcBVIIQwCknRmJDjurNuhL4jOvxg4fJPhl832oy+/+KfFAU3gGeG7D
	dvJfmxLPrFbk81jU0XAnilO8trexkNtcJrlbwA/jwJZ7WEdp6Vc2JRtAzcVx0jSR8QVghBH8GFA
	1id5/0bQb+vyqcfA1RzhV1cFFfzgN4aqvmOeSQGoYFGkvFiqy+a4zXjvEpGSPX5ZDxpwto9r6Jf
	zu7eVSp5kJTcXp4S8bfbZh3Ym8rXyP/qjWdEC6++6DpadcbnXvRAo51+HF8hNoYzARci2OAYZg7
	vcxTeoYF5TLWBOv9pUVmCTipLfND8XqfsocOAGTJ/qZp8DNRxtranQB1PVw2XkS3NPFMEpmLSq2
	d9LaCR1OJqCHkIEF4gi4C0cqtokpkpggD0OjknA1FqZwjNT8kQzajTCO5M4xYlTM=
X-Received: by 2002:a05:620a:1794:b0:93f:35a7:cd4 with SMTP id af79cd13be357-947842a5cdcmr557723785a.67.1794218901152;
        Mon, 09 Nov 2026 02:08:21 -0800 (PST)
X-Received: by 2002:a05:620a:1794:b0:93f:35a7:cd4 with SMTP id af79cd13be357-947842a5cdcmr557719885a.67.1794218900518;
        Mon, 09 Nov 2026 02:08:20 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90619bbd2sm129460515e9.1.2026.11.09.02.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:08:19 -0800 (PST)
Date: Mon, 9 Nov 2026 12:08:18 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: scm: Detect Gunyah by Qualcomm's
 hypervisor UID too
Message-ID: <4kxgqjwnu7qutjw5whtahbusa3shkmjy4yoxpypjy3vkko42f2@ek7wdjm47a3a>
References: <20261109-qcom-scm-gunyah-uid-v1-1-2776343f9a3b@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-qcom-scm-gunyah-uid-v1-1-2776343f9a3b@gmail.com>
X-Proofpoint-GUID: 3WO7GTAu-brG00MYc_U8mr4nafFlPxT_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX0Q//ZSmqvRTZ
 gGHmbmiHGESFlUZ2RddRYNm6Nkt8pnW+hSon4l5/vGQ1JBAJ8mtNce1oOl53Ef8FTDj7IxKxkbi
 pckmVdn2zgOBO1fWS1bxcDJbBSL5YDJUBN+LwRtQDojl5jqWId2eacVVu0i1TvwFFbKrLTyRtfq
 g6+xtM1TVAHy10K2DqP6Ip0R3Vn2Ewz1uJABqypM/DF+3q9XZ5fzXdzdJfeiPkYSafqu4SRMkhd
 VvIQjyEFPiyTfEAsllAUrxNVWSrL5D0HLNjq1M+TN228m+yLj9SE3reDHbD/PBy4Lc+fyPlpLtg
 a/IR88rQe6k1dIw/8fS4cqvSqJnHqnb1v+5cy8gXnoCXhFhk9ic3YycHE65ZMQFsl7C+tLSQmMO
 L7DPUlsj9HP08J4E2qeDtoQaFVp8t00L3HT7UY3o8mg6Zu+SOlkN67X5KFDQ695IjQMOuBFSkkm
 6i+DpwDLYSfeArkNwpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX5WX5gOZXnjD3
 m3Hy2C1oHzGmG6rqeYFY/Qz+i6IghmBkHvvzG5g+VM1AjaCgWaBlPF+5zKhPh60snrKJft2XoJs
 HFUOXVXSLQe0nxZtnj137/XFovrmxPw=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af19b96 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=BqTCDE78pFX49Jf4NhIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 3WO7GTAu-brG00MYc_U8mr4nafFlPxT_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

On 26-11-09 00:30:23, Stanislav Aleksandrov wrote:
> qcom_scm registers the Gunyah watchdog only when the hypervisor reports
> the Gunyah UID. On the Samsung Galaxy XR (Qualcomm Halliday), Gunyah
> reports Qualcomm's hypervisor UID instead, so gunyah_wdt never probes
> there, and no other watchdog is available.
> 
> Accept Qualcomm's hypervisor UID too. gunyah_wdt still checks for the
> watchdog: where the hypervisor reports this UID without it, the probe
> returns -ENODEV.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
