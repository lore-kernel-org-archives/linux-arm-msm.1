Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA84434E5F
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972807; cv=none; b=K467VafnI1oQ93dKYC3vrNGd6qWTXyMOBEcE2Zzkhf/M/kk4dHjxQZkxgs0K0jZOqintqmaaoFHpQc1CaChw5V9IePU+GGaloNHbp0cnutDVyMTU5fIX95UuMYyQ0VADLo07hLugItrsSCULIjoPYYA6/pYPJnymjtWmM9UmZ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972807; c=relaxed/simple;
	bh=6S7gvhguumTs8x/gC89zSwjg5FXbbDoNLA6mopg4Nek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GIqW4fAtFoaBlvczvhyBrtoPsGsU2dqoJodDLuHEGWy5BzWU/853rxZMgLoNiykYZP/rfQc4IgZIy+Ytg1Mx5oCCLbBW9hj9ikEUfoyCzbJc2cS9GU7VKRYTxtQQba7NVznizlo5eNYPfxGh6yeo6Vb2HodfvgaN6cFXn1QTjSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fk206xg2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIZb0U31; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fk206xg2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SIZb0U31"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD66aB2749049
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UtWut++ujrrvYUUkl/6uiLVpbexJuSkb21OzwMvryn4=; b=fk206xg2+mih/mu2
	nfSZKqgKrGv+ue9sovhRqpxte4A2+FEwwQVgX6PFIklgo7YGUIVbXXROpJlKlSxG
	z6zRLMe5KLiX8X1tTNLK3KQEr+1/kTQEuWAzmIciNj0U0jz4lq/JyJ6B9RQCYrGB
	F9zm+SiBgt9OE+yCMS+yUqqRXTwojEiLCDEh7g5EVHtonZ2JBW3ffDzyrwLxzYpo
	AP+rFcEoIC7LHRpphDZuhHemjjSSYmbMQJQ65h/QSnBhe1O6A9b8YBS48P91j409
	DGWjdVYLvFE2K2lgsJ/THOtMN5iGWwTpEl07H04vPc8xqxE6CdX+h37X78adA37Q
	dFSJTw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y7790ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:20:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c9d953b71so3374601cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 06:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786972800; x=1787577600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtWut++ujrrvYUUkl/6uiLVpbexJuSkb21OzwMvryn4=;
        b=SIZb0U31NlgYIsfFIbSR6VypZxxWqwIhWjdX7AO6LbsmF6UCBTvx+5lM1POr7xOcFW
         /Uf/TVMkaVIoNinq2r+amZGkuF83qE8d1Ox2ghxknQ4NufC3w2xsrdW5O7y+tkGSGDQf
         BkjGU4psRQ4+Uhr8WuzDChGSZ8wAWfIen/+440gWfg57RTHKJ3SDQNLmAQ0b4BQ+Zl4p
         TK/5hWa80W7YwogDfpM0t+ldoFPfVB8DVP6BAjJZMxLXX3T9y1CJWDmb36ZRgTXhjePe
         4DvgmqSA0hE3wi+oDkTMi/qA+hFNaOtjPyHzPV+xbKnjB/789Bq8xmuAg6OXY1X/yf8T
         PmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786972800; x=1787577600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UtWut++ujrrvYUUkl/6uiLVpbexJuSkb21OzwMvryn4=;
        b=Vqlf9cE1TJxjA4lboPmMFGKdHAyfB1bwLXSQVhiSL57aZ5l0ViW9SQ6T4ntJPnHn8W
         9HPFnRqrfl0k0osXJ+8CAAP8oVsovTvxLlWtI1mnfCJ1uCYS6j7xZQ669++XLG01SW6/
         C56iV8cYSX9DVTrE6Dve+Ie/O9YFwp6KEQVlNLXxT+xx3KUN8YChbREugd6sHm6urGkL
         hfRnbr+ddLEkzE2t+BPHp08Et5xM2MmK6mToUH54BoG7UzGDVvvIxj/yi6ZiePGxv8m5
         fVVHmPXjF8Pdf9oPTlOt4a7XoEB2kf3lSmjx82nMduWm/AZ7qJRiawHYHse4xiw++Q8A
         M5Eg==
X-Forwarded-Encrypted: i=1; AHgh+Rqj6/XhEpYOamQZoouUNi1sjBrYfSh7yIy+yJ/q2wIacoZ0zJKKXB4wvBwAx+AODK+qKAYO/6AN/4eHAz7y@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/q1dTmSD5AKIR4FKQC/amgT/SGxYJ+Z6MC9J32CuVP8e/nEt9
	aa4uyIQ/M6w5G5Ux/09rqoLlzjIyKG/PuPy5riILwqZ5o4Aqm3DGKRnxrV8hkG8wuYNzEnHZmGg
	KC3nsEnWcIrYdpi8uVusHlLPK4HpvR+dF2mHYdE7Vj6BZwkLEkF3D0DDaJi2Na9jf9x0K
X-Gm-Gg: AR+sD12aNoxkE54JOBxT7+qR90FO4upHakgh98apXTaxcstkOmXQcjNOm2OBOCmCMHk
	f0NAI9GbtUl52FG+5/Dp4h9rpTUeWvoOo9FueZyrQyBCBGPbLjWhZ4BmH1b3Mqzqbs/C7tyDi1c
	UQDmlr7//N2uI3mgEim2pOfaQobf0l0eeLg+5obxpMAVIsuH25ghKuyFaOhA20JzxMkViN8L0iH
	aysxnA2RURaMpmAQukQl4zELzeTsi6DyP+LnFdRrzPhmP3xHbwFQN+Tx+iEEoWkW00cLpJj39NC
	jDbfYsl9Uoknm9EYkdVMK2jmXcIjxjfxplLU0R6y9hWOfFtNjihr5mazOc/2RTAVp41r9baQt0j
	6InUhsTol+yxxGQs3SsJJZ9v2
X-Received: by 2002:a05:622a:1787:b0:51a:8079:795e with SMTP id d75a77b69052e-52d854d318amr181058231cf.4.1786972800014;
        Mon, 17 Aug 2026 06:20:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1787:b0:51a:8079:795e with SMTP id d75a77b69052e-52d854d318amr181057721cf.4.1786972799522;
        Mon, 17 Aug 2026 06:19:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fea2ce8sm56922266b.17.2026.08.17.06.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:19:58 -0700 (PDT)
Message-ID: <81b85f8f-e4d4-4d19-aa47-97739eac030b@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:19:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] remoteproc: qcom: Support the Nord HPASS ADSP cluster
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfXwqE8JIfd988l
 J49EtWPGI1M9osYKqN5MQePw0veL7td4aC2W3Iu4FOJOG2WpWm/wMsEc5zRxoxeZeoMEtxXWOfk
 LguuWvYxX9SQoqE7D9YZcmAt269sAnbcWGiuHlRu0+aBys3QFyJlIOBqHxZOCcdXod5/z5T+b/W
 VCKRr0wXPD+X+g3y+VtdYHVjYr3qc2zEeWNEFkND9ZzBrczT2gmUE3gNKass6qoIeYWhYBH8cpY
 3xDGQ1P4GWy9LVh9OLm9Yu+cwTfsKB2Rxrqx4Pge6Wn5veYSDr6xpSLj6spGNGjXvEarOcs7vgv
 V8X6kTTJBwxf8L+qbwKQ3SjKuLGTcSNfdofxTPxBCo9Y5zxPtFJJI/DN71FkLME+tfG8rEg+yxb
 Eo/AM9ppZAtjp8y0m+t0EOnLMG1UsztZuJ7jQp0yvtx5TA9dZg1Az2/PZO07LSJVTglOoM4R3Of
 YN7rz/pZGDj9iLnG6sQ==
X-Proofpoint-ORIG-GUID: pNBirLhardsxo3Wgb5dvUnoj8DOTBmL6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfX0jCDi0w02byT
 igH+UIIj2jBXltYOoXR23AodDAfeEWKrB3KyvUvJ8uyqP9Fj4812Gpjowq9SfNO8DP9tc0FKkDp
 jYEi3bvpHU9iXT9L31UbxckNd70po88=
X-Proofpoint-GUID: pNBirLhardsxo3Wgb5dvUnoj8DOTBmL6
X-Authority-Analysis: v=2.4 cv=WNhPmHsR c=1 sm=1 tr=0 ts=6a830a84 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=8HC7wV32qgYdxAFQJeIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170101

On 8/15/26 3:25 PM, Shawn Guo wrote:
> The HPASS audio subsystem on the Qualcomm Nord SoC has three QDSP6
> instances, ADSP0/1/2. They are not independent: ADSP0 owns the resources
> the other two need (PLLs, AG_NOC, RSCp, CESTA, THROTTLE, QTMR) and
> initializes them as part of its own boot, so ADSP1/ADSP2 can only cold
> boot once ADSP0 is up. Their firmware also cannot tolerate one instance
> going down on its own -- stopping or restarting a single member leaves
> sysmon/glink_ssr notify requests to the siblings timing out, and the
> whole cluster unable to recover without manually stopping all three and
> restarting them in dependency order.
> 
> This series models that constraint. A new "qcom,cluster-root" phandle
> groups the instances; every member carries it, the resource-owning
> instance included, whose phandle references itself, so both cluster
> membership and root-ness are answerable from the node being probed alone.
> Instances without the property -- which is every PAS instance on every
> other SoC -- keep qcom_pas.cluster NULL and are completely unaffected.
> 
> Two invariants fall out of the hardware, and are implemented
> independently of each other:
> 
>  - Root-first bring-up. A dependent member's start blocks until the root
>    has booted.
> 
>  - Coupled, two-phase teardown. Stopping or crashing any member takes
>    the whole cluster down. Hardware testing showed that whichever
>    member's PAS/TZ power-off happens chronologically last always fails
>    its own graceful shutdown ack -- both the sysmon SSCTL QMI ack and
>    the SMEM-bit/IRQ ack -- regardless of whether that member is the
>    root. So phase 1 fans the stop out to every participant concurrently

What!? Is that intended by design? Sounds like a crazy DoS attack surface :/

Are we perhaps missing something to let the uncrashed DSPs keep running?

Konrad
