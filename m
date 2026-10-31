Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793477986;
	b=47T5v26VGhshxuoeAETvkauMnWITbpHp4cxjUSX8weETnrjJIksIBm/VK7geCjBHp2Rq
	 AEJaFQlMEp+58HTv0QyO036eB6t1U+0Rm6gdeBO65mAoyufpW5yRFbP8mXyvBLOxeLT37
	 /0Asdk1UM4ybzRfDCPLUOp2hkrp/cqk35v7x7Kfw+ZKtliShs+LJbf08eL7GIkZod28Hv
	 gtZDnTew8UjXexlePYw1i10isDcox9DCGW8VXKKhx0Q45wloRvMbDvOA48MSAWGoyE+IT
	 7n/l9AWmRy+EHv1Odz4lwq3o20N7ovMjHPJUFlPqm9mUUko4HcDuIAehIie8vy1LVsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793477986;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+VdHn6TpgZyyeQuYkzHyiAfkE16dWOMnysbVagffdjg=;
	b=hP1bzEz4edk+efl7c3FabsDjyL1xXIT5AqohSCqm2l8+b19Rxv/68vW5y3y5PgLGmkUF
	 8MVyvGQ8fLyQ4OvW49g6/zDNlYXwRDPBJDg7ymgfHLbfWdWxdup2/8WYMjYh1uzTRmw0A
	 lLwCjk6WXF6wRHYEp8h7SM3fZcVWSQSf1V1S1UfyqUVuK+H4tVvzqmQLMu4wHnSRRRWn2
	 PU5+Ff2tkv+2K7TkYQ+buz/5WmWU0MK0ZFUTRZMnlbYpvMbQa2NE3qG47WgDf/tkaEZS0
	 pn/9IBYOk/uXoTYUc4uh+dQ+x9EEC0c31iTgHc74h9MKgTxqTH8M5b61qMc2F6PViOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GcCODbWT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z3k1CXZw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D35A606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 20:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D35A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GcCODbWT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z3k1CXZw
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJEw3F3555830
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 20:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+VdHn6TpgZyyeQuYkzHyiAfk
	E16dWOMnysbVagffdjg=; b=GcCODbWTlGP2km+0+xVTV+4QoNXt90KOyGzd1qpv
	VmEHo6M0wl8AAH4w5jw8veoFojTJxn1cktkgQoCLR8e5FSDZIF4UqA038Cgs5pPM
	4iQxJZ4PRI5ty3Lgb0WFWg64u0dD3AQn0LRPEtudoSjFfR7VCnNioPI7q7fEMCJk
	oq1Whcbp5t9J2HZS7a42gBFJ6tIwCDFJBvdezV/RkGkn1WGujMpqEIdFSUDbKIw5
	5pza7y+5NUgSX8+4hJ/sMXVinn5aCm2ibyQ+Mcydqeg/IP8oJowmE1Luy55OfRbL
	Xzx0O5rJolN4IaDLSGA29XULb88BVxCc2BUlPnHrBRL+0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxj21c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 20:19:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf6c528aso258890785a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793477984; x=1794082784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+VdHn6TpgZyyeQuYkzHyiAfkE16dWOMnysbVagffdjg=;
        b=Z3k1CXZwe2WywFjS4ghAhSbqt3FAajR99rIjlLKx73WPDv0f/fO3QB2/9Kp3UbvtAV
         qNZEaoAtI32I3abgqsq2JaLJLj87wE7ZXL5DGyAkvFf6eQ9GEN8uP/fkhCi8O8sLtLEv
         O6jys5cqZjQzLLCFrKerrNkIONETzGFG9Mj6LmEnJtmEFa0nmBF22V08Reg1XyILCBHy
         n2AZvpstWXh9v2JjuNX8m74hxsjQfeinBBcnzs8z5Xk77WzHtjQspLyoBiU7pL6+k4IN
         j0TyICMD6+93IHwg1r0lO0tVlDQpqVOFGydnE1fxbohKSGv9Wyqgj5VqoIdxsTY7vdrG
         JYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793477984; x=1794082784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+VdHn6TpgZyyeQuYkzHyiAfkE16dWOMnysbVagffdjg=;
        b=d6U0bUWQ3MvJqz+lU6dXQ5s1pHXwO18zfSfdcpg+5q3DvdngPdl3VH/A+beNGTJ26S
         STs8/5Dizs0GDZmaS61s+yEMZV5glJFaXiNu7yBsrgJ3VLDaJ7elElwwnAhKV2LcGkIY
         KfGPY4giAPBSVjqXrbkbL8n9QVrx3g5HGQXAxnC+7v2Dk5UO2BTbB4cLZ9pasXOagBsu
         UOTWopxCo4Tgzm2Yj5ZAGhrNfvVzBkipKL5DRbL4duhoh2fzuUpRecwHh5oOQAxJnB6a
         +3B+D+80leJKWe5+NMwGz9LXYcZO54q7uKL66/9QTLm+KFpwzemVrAXRe7x/1A4tqG3o
         9dJA==
X-Forwarded-Encrypted: i=1; AKwUvBxLGaIKTiZY+HP6AewE+ScIIQopPypPv67CYzn7rJkVTYMYx1AqEjqgMLMNr5QkKaCUA4e1U8eL9ZC7L8pi@vger.kernel.org
X-Gm-Message-State: AFq9FYL0bLpCowTXavz711E2YvGFZjQeJHX82arlDh0uVBlu2ot6T3Wr
	6BaE3ua/frs6cQn/xCDf2Q/TbxMZ0oasnmxI7lPu6FJGYsKRSBgmnH0y17jIWdnkh+oDgbhIFKd
	ZCMBRUOdr1Brnx0RPwN0R0G5qTLj9GjJ2OIzBgAoVXdeAf7X+S4UzUz//6VzA+doDwDR3
X-Gm-Gg: AYBFou0141ICC9FHAPY888ZVOHCKvhImXGrIUrN9OQtbvGk+MaZpH7MsBkngR3FRCcE
	AYhM4h9+xiks/PmhYyxw07OVTZfFN63OLTxeA9YFmHUxhJV+Kv6fNfP1PrAoeLR5rixKqK4214R
	pPcs6hyVC0GlLas2DlAA0uBjwBU1uDvq9bwvEyo7yGEVowOe5DpI+A60TTJu2g3VAPifuIDAhNH
	2fDoFcK5P73bQeGDJGjk6AtUfrxG6idmvcrAthfHZDggrXKMZXWV7kp9EspGLebI4YwT7B6VG/t
	7g0kK0vGspNltY5+1sVzd+TGScqGga8njZUtQxlG4gV5F+o6P2l83YpP/7qtZH/xBQPi5/TpmsZ
	R+iQSxK71MixJsvnUydZ9GcEgKMvYOdUJrCjAV1VnziklQXqhlXeo8WqY8Obajh7cWoPkXL9F0V
	/yOUnPPj4LHlOkF2q09zDYrG6MRy45IT5I4t3J9dQLA7TFxOSbwVJqX5mDJDYaSA==
X-Received: by 2002:a05:620a:2b89:b0:93e:c12c:9dd0 with SMTP id af79cd13be357-9442177675bmr987618585a.80.1793477984349;
        Sat, 31 Oct 2026 13:19:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2b89:b0:93e:c12c:9dd0 with SMTP id af79cd13be357-9442177675bmr987615685a.80.1793477983766;
        Sat, 31 Oct 2026 13:19:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe072c0ccsm731601e87.30.2026.10.31.13.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:19:42 -0700 (PDT)
Date: Sat, 31 Oct 2026 22:19:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-glymur: Use PWRSTS_RET_ON flag for USB
 GDSCs
Message-ID: <crsmuaonoizluexbbfjlzaaidtun7gsveps37mhaav7uwpfsr2@xwqtiswnoj4r>
References: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
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
In-Reply-To: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
X-Proofpoint-GUID: umr2wZniwZXlN1yLmrVL_7nV3KrrAX-T
X-Proofpoint-ORIG-GUID: umr2wZniwZXlN1yLmrVL_7nV3KrrAX-T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MCBTYWx0ZWRfXxQsFCcUDbj+E
 Gpgi/8O58D8ZymbW8gG1nNHAOmgXv4LG8s/oQtqzhqXcfqDUtpbjRZjbtiLLeIphs1Np/ueXYhz
 fyYjAreInlmis81vfrZyM+/6l4vjf/0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MCBTYWx0ZWRfX877w6AQ/G8G0
 goUPHqvVmIF0QYQb0Ihw/NCNY66vRoVDekGXwNtMcHQZW882oqLECqi9OkNnLzBVO3Vw8kbjTjc
 S4dAtkJM0uwIpR7s80JtjA+MqwWZ/ZLnNlN6lQAdufOjWWxvLZ2SjSA8LvuhfkmxhDLKh0F0e1s
 jzTA4BLTgSAJPt4UjAAbRpaCOb/fhiKo3xfH0MhgKGNeGNsQAIQHBBjMWli3kCHJqlDo6B+4Q0V
 v228OqZkPLg0RtzptSeejy28HWPomJVO6c3LpouhgwuvnBmmri59wHhGWTw323mhz8SDlxyGWKf
 Z1teaUTw8CqLJLcEDIDgHVilUmS4tp4IPQUpI9dWH40wd67qBLrUpyKRpBlijC+JRxy70GRKJJT
 sHT2zYhG+9vDM8lYzgv70qzQ/7Il1/cZ8+otFW1rlprZqDdhP2fXrX6OQBx9bjczElGwiTZ1uv5
 3brkHNZEsijZttmEhrg==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae64d61 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=XHe_ECugD20tH9J9tGIA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310080

On Fri, Oct 16, 2026 at 11:58:44AM +0530, Jagadeesh Kona wrote:
> The USB GDSCs on Glymur are currently configured with PWRSTS_OFF_ON,
> which allows the GDSC framework to fully collapse these power domains
> during gdsc_disable(). When these GDSCs collapse, the corresponding USB
> configurations are not retained in USB host mode use-cases and this breaks
> the resume of USB controller from suspend.
> 
> To avoid this, configure the USB GDSC power states to PWRSTS_RET_ON. This
> prevents the GDSC from powering off during gdsc_disable(), and allows
> hardware to retain the USB configurations across USB host mode use-cases.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-glymur.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
