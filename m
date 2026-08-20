Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C191938656D
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 04:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787201073; cv=none; b=B9ZysdzKDnWJw5OGDPAcJOf30RjqgsaZZIO1kuB/d125VejzGggyLBBg4dQtEy8zHBUXvB4Txy3YFoXbMs/cAMrmqL/XctZ7Mt45xqA9NelYWU+uNssJZ7u5F+mB3twoOXF9I1ruTlCFWK1qTuc6kZklCDJQIOlq2B9O0GxuOpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787201073; c=relaxed/simple;
	bh=Tm7ushPO3+o0tFF8ecTjKX3feR6JwGsZGq1xnLwN6k0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TPclLcrscMLycyWkYeGtIZv2IOyvXUalY5izDK4qVBERmUMremy74bmqLUYJMoafPXvreo/klzFBOk+WTjbxTdgBv1u1DJ0hAsY/C+6DPbkGAZlO72aTZ9fKm1ZXTACqiNUcSWFH70vrV7ARiphI5W/YjMUl1sntot2ehoMCUsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oqg64kbl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SKhUR220; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oqg64kbl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SKhUR220"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL87qt1027858
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 04:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4YowyjfOG9pQiJVkE66VCvqOZqFDnt2tLDraq/jeeko=; b=Oqg64kblkgDE9hM+
	5R3gEXL6b2PwZeH7sTYv+rflEPuOfHtuPlgqgtIlyTidJd7zDARS8qKhipyqQ37S
	/A1W24mvxmALJ7exMbU6+CdVsb+8KcTawjYrKtZ3o2k3XqnNfjNIRs/ilOfC01oE
	1t9a22Kr4jdj+L6NdPUMnrEpzPxgkr35MxZ0n+PNhjEloqePxZKk8Yp9/AnI6rj0
	GS3X+MYoI/qkjXskgFPVVrT1veiqgl5L/UCrwf3B1PgKmLJQx+oI0u57Ef7raNZq
	g0RdqqUGQbTRF7lgO7+dqpWrwrushcA+yjeMdlKBM9h8zr1utauJTs19h5n6imS0
	APeQ0g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es4k4w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 04:44:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3950b1371a7so2703986a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 21:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787201069; x=1787805869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4YowyjfOG9pQiJVkE66VCvqOZqFDnt2tLDraq/jeeko=;
        b=SKhUR220CxSNiGD/BkdoZ+fzXM+h6o1UTEUp1e+G0JxLfAh31f4efntqiJvymI5S4C
         1fBKYfE5nLmKoTrk8DRsnBXPNd2ZEeyxlq5BqPZCGsXY+JMXxU/Wy0mNqRA3twU5bMU7
         RcQ6kcM/KzHV+19pWsmzyLT81EGg74GDe8cHwG67Xei/m2KCcoNho1nE49XnFrG0uSRp
         j6aSTGZx7A24q6loVj23xeFqh6v0gfeqkUkN4dAu+8SHrmwRR0C9VOaw81rvU2MNUnOz
         w1PzzzXDHokDOWyCX33EhERydPzYEATe+eFRwkMh6biN2lCmRSFKi2U4b+td7qZ6HbYS
         o4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787201069; x=1787805869;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4YowyjfOG9pQiJVkE66VCvqOZqFDnt2tLDraq/jeeko=;
        b=edHwOm0LQqm+sDlxQA40Hzt8/3vqleGH9XBErc5dQZEjKXCbKXHCW+/VUJ50GxtoK3
         iRQeBThMtIJ6OIMl290C0P05mXGTFVv0JEnnM4aZOXTqXoCDwXHUVDRL65znBKU19QlN
         WbPq1q+oK5lvsNibFc+wA1SBjhod9B5xwuw0zu1tY3butbRJx2LDFgMhlGyOGy7XZqgE
         O2U6ylSVBp5o9UZEBX0UG2JjRRUL7tx3NVjQzCkW3BzkUKPNDCkNutjLmGPTlZMI7pdc
         sw7wgQxJLTBwK8ka4H5OxLHpH49NUn/tgPrmVj4E736DWMioqbsES4fziwL23JcisAUF
         NiEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdlP/LwVjTbwLGKaP5KLFSrENXuEGFXITHoVDb5H4fav1FQZ+tn02W5ppr+DJBceXdpXRIvdsXYgIzMEVR@vger.kernel.org
X-Gm-Message-State: AFuF++k3gjGpARdbgda9AgHgYK8bU8uclVX7EcC+pqhjyRNU7CmsxSyY
	TDYsWxAPbWi3TP94go2Rvu5N7AQz5lqijVlD2SjmFQuRVBpu4JhYY/HPVBxH5xApX2JoV3Vetrg
	AaHy93DzUjNrktXf38Pykk06W/iADiGMddGloVVFPMuohN7U0h1fEv5lLsXBuTuzb7sPA
X-Gm-Gg: AR+sD12VmME/qWAF2KburxzvueXYg9OYdyahlcvHJSdnYaSVXrufZUzI+6n6ZT0o0mW
	XbOwQwY53/X4xDXmRXwUPZjvNNPTRn35UdcvIzJ7Ulm3TP7+bB6oHBoByV4pO/EwmNym3a0IIg6
	eZINSFBZhcMH13tKtqRLZGb4yHZjVFDK+I9XxmCa/OrfsKzA4QzfQNccxxZLUl/+vq6yOTyo56Y
	ugPr6aLx1bwVxeUwD6XXyrkoAUMCZxtmwfO6rxmMHtoca4hh3BLBLmck/WCsO5hWtb6w8zcEzGK
	OtuJSyFagqvbZ5rHddwaNLlxd+yc0jbfE/g4xzUxwQfI9Fan1Hlcl5ObScSxpiVO+aZqP1a8TOq
	qS+3tK+v0yrjQcnfSISDgP1ePQ5G0bQ==
X-Received: by 2002:a17:90b:2f06:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-3958108a0f9mr19146131a91.9.1787201069225;
        Wed, 19 Aug 2026 21:44:29 -0700 (PDT)
X-Received: by 2002:a17:90b:2f06:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-3958108a0f9mr19146062a91.9.1787201068747;
        Wed, 19 Aug 2026 21:44:28 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef7a0easm14338932eec.12.2026.08.19.21.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 21:44:28 -0700 (PDT)
Message-ID: <bf82477a-22c3-45d9-8e0d-ffd4f054b5b3@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 10:14:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: fix double-free in fastrpc_map_attach()
 error path
To: Yifei Gao <gyf161023@gmail.com>, Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260806235056.456341-1-gyf161023@gmail.com>
 <20260811225102.1077841-1-gyf161023@gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260811225102.1077841-1-gyf161023@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f4MO6eIkJXsbGwRDzj5yWh3hMXFzfOzO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDAzMSBTYWx0ZWRfX8JU8Yn7yoGlu
 y3wBu5IgciZXuXXF2PAONv3ir2xXQ2kdU3Y1HVQdr/b7gaZKpYbOfgoT5g3fvfADF1UY+erqwKq
 zRpagtGjaQNjkPw9iTm3qApD2jUyQlwXWnhG7yf5IO19nva68wCaTIGgAQM6bxi83hkQqHS8Kya
 7JLTZSBQjocazXp/EVl5XbKNidCWDZbW6sdZT9A+vy+n9rTOR6kuDz9j8WhUTVyCBRelbCwfRcy
 WFSk35ZNJMvQdyGNT6jDfox5LMnho0FfTvy5etyOMR+YtmUfE3vt354QBOCDB0xgaL5z6sMX3vE
 F3aksP9ryr/tWJlrnhHA1UhAeLIICuLIR0L6sqhcuAzzlCzNiAw3AuzBmQj3wvpeo5B41nJ/tp0
 u7bQWtJX8nbqYeIY5bxcQvk6ixfw4M1TX+rcTu4TYvCQu3soOPTZECfTNZ9dJEvGrnzYX895vKq
 3hoNCLTQgnYjzTNdeRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDAzMSBTYWx0ZWRfX6Ak4N8iC0Luf
 U8tniRN3v0LHKplwXP5FrvsuTIHUa2GOmwRkh5cKP9VVwW3gfTno74xG0ihvur+CrHsdlT7tLhs
 04F6DEIwTDdJp3+tmuwWImlhX5v+Ih4=
X-Authority-Analysis: v=2.4 cv=CN8amxrD c=1 sm=1 tr=0 ts=6a86862e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=GpFdYKwLFXUddJV2vI0A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: f4MO6eIkJXsbGwRDzj5yWh3hMXFzfOzO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200031

On 12-08-2026 04:21, Yifei Gao wrote:
> map->table is assigned right after dma_buf_map_attachment_unlocked()
> succeeds. The two failure checks that follow, the len > map->size test
> and, where subsystem VMIDs are configured, a failed qcom_scm_assign_mem(),
> jump to map_err with map->table already set.
> 
> map_err manually calls dma_buf_detach() and dma_buf_put() and then falls
> through to fastrpc_map_put(). Since that change the error path tail is
> fastrpc_map_put() -> fastrpc_free_map(), and fastrpc_free_map() already
> unmaps, detaches and puts the dma-buf whenever map->table is set.
> The two operations therefore run twice: the second dma_buf_put() drops an
> extra reference on map->buf, and dma_buf_unmap_attachment_unlocked()
> dereferences the map->attach already freed by the manual dma_buf_detach().
> kref_init() sets the refcount to 1 with no intervening get, so the final
> fastrpc_map_put() frees the map synchronously and the redundant cleanup is
> deterministic.
> 
> The len > map->size branch is reachable by an unprivileged process via
> FASTRPC_IOCTL_MEM_MAP with an fd whose dma-buf is smaller than the
> requested length, before any DSP invocation.
> 
> Route both map->table-is-set failure branches to get_err instead of
> map_err, so fastrpc_free_map() is the single owner of the
> unmap/detach/put sequence. map_err is retained for the
> dma_buf_map_attachment_unlocked() failure, which is reached with
> map->table still NULL and an attachment that fastrpc_free_map() will not
> clean up, so its dma_buf_detach()/dma_buf_put() must still run manually.
> 
> Fixes: 334f1a1cbe03 ("misc: fastrpc: Use fastrpc_map_put in fastrpc_map_create on fail")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Yifei Gao <gyf161023@gmail.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
