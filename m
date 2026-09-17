Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65A14DDB56
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659677; cv=none; b=mgQ5QPScbF2kgBxdBO/OYj438yRCWJJNewdkOiMqYc/OK3Ws6zEHyFOMj+HrvZ48XoRFDCF0UlE0N0owO7tK83CMpM5INUlz6z1zxFO/2eVslBQRbdj0b2jgDAQxgCJDFKTskELdEVxKpzzTPcCFevJnkE3zDtO69vi22gloXrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659677; c=relaxed/simple;
	bh=niHJvKcGc3sXIxEu8fC5t1ndvGH1g95O/YBiVkFfwJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AE1t7zYzcFUs4FG7TfA5cYmIqOq8IM3Dx0BgUU4nvzLC8prapuOsIdlyYVDlOH58JJpe5Uxtylj65Vlj9WeH8ult4xjOQm5wF8BvBKJOCAYFUHSyEmV7N8IjQLVbAtmkhXN8OKvVQkXJquNTAIkl8TDcCum4UVGMTGIh9XTrKzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGKB7onL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BWBQRiiM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGKB7onL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BWBQRiiM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDjTpR2266805
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kv+f2O5HtP2UyzQFqxgl0Ck7
	X1yB8VDtNQPrqEOFNsU=; b=KGKB7onLVmzH2nA9sBMm60L5L8sxKuiGItypEMRi
	mIBVtN6RcDV71YuJ3n9O56uxKryNptHQN7FmDKTrDePq4VI+GVvEBAcubco4eDcj
	h3mMQXaFEQ61IUTZalhGat6QW8GVeALeNR2L3vsc+umk8EmhCs0Ez/mRClKEVRJU
	oQ1gj0G3tBSWWR7EL1/cuRHsHQjH6BERl6WsF25FxUrvJqia3bBWFWMyNSOk1GGV
	O3gMVtlUBChNqh/07gLFswwJi0VvNUvSCaPyITb+Jv6eNRiog8podyT0Ie5gt4U7
	tKzqyFNElAqLPR8s0gJdtmgfsDauX29PQ3UbcnW47j0t7w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfpph32r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:41:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936e393061dso155142085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789659666; x=1790264466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kv+f2O5HtP2UyzQFqxgl0Ck7X1yB8VDtNQPrqEOFNsU=;
        b=BWBQRiiMXhF1HwFET0v43wpLH/xcy5Ohq8pzXEtLCQKgeEktcAIRGOiTOObaci8hjG
         /TTLWAiqWDwc/HzUAfGmSQuNNmTN2H0+6gfzsuU3doV5wy8bIlaexq5e6aOJK6kj1JWS
         yMQPbbC6E07ufG82hh9jVWtABp14Xh9xjoKeHv5ovfSXGhnb6oyFWKOJOITc20+TIYax
         YpFllMbo4dTN3B1x9i87aMDyTLrDBoASI9lq/SZEU9pZNT6BFqvpef27PSZhAGjaSBe3
         +ARpy1Tohm7v2xSr5VVGqvPEnt60wcG1mLwarFed9N1CJnUyHAoWYRVpmJQocOl1aur4
         AGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659666; x=1790264466;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kv+f2O5HtP2UyzQFqxgl0Ck7X1yB8VDtNQPrqEOFNsU=;
        b=lefE7EOVmYpYAHEkS3K5FaT36meJcS10KUAbiP9pauCFip8r0iynmU+iLyOhvjKaWh
         9qJ5eRWVXPOWf75WoJtZm8J5632Ye3ZJ94Mpoa4zPUnOXYbtCxU5ehnvrkWMWfuel68u
         Niql1dpFd+E/5YyEmcu251p4eoKfncQCAt21D3H/n+Jvr/5VnMGjNjBF3N7fuoshIU5P
         +EPU938f+pT7WtrfeAhkKTTW4Oe4Q94OrwGbZoQMTHzPIRBO2FQX/B6MoYa9pc9XjGxK
         hAGZRTtHY+y5yUsDGYVrs9bmJMMiyhG945+2HvfGn8lsjpzLUn0qwq15nYnKf5X1Qru2
         lAXA==
X-Forwarded-Encrypted: i=1; AKwUvBwajANxZNehHYTTjZ2PiDUwPsiI2W7y07uCSqByYzCoMx3CLpK7pWbEtEATRyzedmqLD5S/vBAWpVLtwcwR@vger.kernel.org
X-Gm-Message-State: AFuF++nF5Oh4cwubCIsw4cbmWsqkadqmlTdW+uPVdGRYCMYmJTKadxZw
	kUGV3viNB/nSJKjdOJniW5/SRSN4g7JN1mhIupIOcERx39t25jHdFQ0iZ8/RgFw6gHnDuzOal9X
	1U5yfb2U7UV8RJYavjKFrU7EwgswCsaE0GBVLkLy9+/XrnmvMnSkQAsjtuvUTA2V5jIO7
X-Gm-Gg: AYBFou25PPMgZVM+d8dalSukxC2XSw+LcASkDFjoe0IeAWGBMnyq/H+LhmDUTA9THcB
	C6t+d3zAxK2y/MUqPK0IwaZa6yITSLBBrdKDwgyYs7c+xI1JqDQ/3AdHH5xmhNeGNjpW7YnOnjm
	K7N9bpjW/LaXE23kl/rgzsYEkhppzfjf9+fruRAV1iTkJzlRPvHzsEYJux+C4Yi8MocISeoX6XO
	UaCOBsXwKgmAeBimwooMtselYS4QNZRWNp9wzEsnYSC8NfVgxa384COdJKDjP/yBRIdOZ7aqiR5
	TYaDxMStrAtqzKYKNRMmFR8j2Z4L8zofs+gosXW3n9K/0j7psc/cyrmNCe0gtxQ9eRJXMNgCItD
	PqePddJ+fZTTDHA==
X-Received: by 2002:a05:620a:4621:b0:939:deae:8ca1 with SMTP id af79cd13be357-93bb793775cmr1229079585a.44.1789659666294;
        Thu, 17 Sep 2026 08:41:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4621:b0:939:deae:8ca1 with SMTP id af79cd13be357-93bb793775cmr1229075285a.44.1789659665701;
        Thu, 17 Sep 2026 08:41:05 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24034esm101548365e9.15.2026.09.17.08.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:41:04 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:41:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jic23@kernel.org, sboyd@kernel.org, dlechner@baylibre.com,
        nuno.sa@analog.com, andy@kernel.org, arnd@arndb.de,
        gregkh@linuxfoundation.org, srini@kernel.org, vkoul@kernel.org,
        neil.armstrong@linaro.org, sre@kernel.org, krzk@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_wcheng@quicinc.com,
        melody.olvera@oss.qualcomm.com, quic_nsekar@quicinc.com,
        ivo.ivanov.ivanov1@gmail.com, abelvesa@kernel.org,
        luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com,
        mitltlatltl@gmail.com, krishna.kurapati@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-pm@vger.kernel.org, kernel@collabora.com,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v13 04/12] spmi: Remove unneeded goto in
 spmi_device_add() error path
Message-ID: <7xf6fvsmcpqjpkto33g6o63ejagcbyitoaetvxww6pdijirbkn@etvrh2weic3p>
References: <20260721093626.96264-1-angelogioacchino.delregno@collabora.com>
 <20260721093626.96264-5-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721093626.96264-5-angelogioacchino.delregno@collabora.com>
X-Proofpoint-GUID: nLCuO-eMw5fwX6r4z12ZiIsJyRIEoTBp
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aac0a13 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=RPqXdwRs98PbUg5oA2AA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: nLCuO-eMw5fwX6r4z12ZiIsJyRIEoTBp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMiBTYWx0ZWRfX9NBIlgvXY1KZ
 yWP/wBQHdACrWBXuB7qVKMDVNXEwUBfH73BGzeg+kmsvEtYcqteWhrRDz38GI5VErGMAAQqkDZl
 O/xuTk6ox7blBQYzoqS8j00hriiF1HHjqJOF3Bv+YQHfni/XvWsHYDwEbxKvsNM+9L71+PydE99
 hJgsKVxHGwQ8WxK+pwYAQ/KHsVJ1FWChvuvSjgHfEHegAs6oLeVmBCoLmNMa6GrlYaDbfcX/eyr
 YNyCJRmokngNRdas13tCqSlow2RwBgVuSCmly9rbdLtZksWWqGCX1Rrem1ZJnfD6Dhaf6T4/gWY
 A1Hjl5khy3I3ZjemLMV9aOlUnsW4gvEH0EGNvXnGvU8zeYWFaNw26eNJPK4X02u1wDCwfyrSrsX
 Av79BWJ4/wDwfcxX8HbK/eSGD4A2/4e4C3uqPQp+9laTlWL6xFx3hN9wSdCD213jrBA7z4fKMo4
 ejuw3fsnsInmg8V6GAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMiBTYWx0ZWRfXyyiA2uiFoav9
 yNjyeKNiYcbVkjAPnqDnc+IJF9i3x49Be+e4u9U1x0FKw2Tn2ua/qfQmJsMJ+ObHYxAPKwOn0dU
 NMhGpb+gKMQfVOxiqEQZihFOLAaZEUw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170222

On 26-07-21 11:36:18, AngeloGioacchino Del Regno wrote:
> If any error happens during device_add() just return inside of the
> conditional, as the goto path doesn't do anything else if not just
> returning.
> 
> While at it, to improve readability, also change this function to
> explicitly return 0 (for success) at the end.
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
