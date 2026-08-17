Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F9740B11E
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786969417; cv=none; b=IQdVlt1UWILq22mT1XOaH1H2LvyDCGn/8ApTCHROPViszdcCcFFXbX5D0czxVbaDqcN+fXOluKtc2dxn1SVy5zHOG+r5I7Pl2yGWvhXCumHEfmfd6WbW5UJLD051zt1aUiroMV/BUl26co6SbsfC5FoJWATuvthH1/NyMnPGZh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786969417; c=relaxed/simple;
	bh=wfkEsWkGGM+8nn8tEP+tS2uM961N0GG0WvR9mkZOtG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LKJpGWwlHaWp8V+9rtaVhCch2jo2QYVDsSgf8cdW9u3mtmt2gsjdd9zA5FZBs6oFMuBsUNZH+uBAk7ppjgXzMPIuhcDxGWIiN891VluDoOt3PNFPdn/fu/htXxSuHYw64YQhvVemVgCfaBXrNax9gI5m7sYwJ/73ysR1NzlxKqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HPCRI5fF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2UEZm7B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HPCRI5fF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F2UEZm7B"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HCAWmv2271626
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d+OizPuXV21JjPSONb3Hnxw2A9l39gj4FyuXf1WadWI=; b=HPCRI5fFZbp2fS7F
	R9qR+44QkiqBoStXta35yMhjC8EwoXfAJQ6qiTVz6cfvl4xOfWFX6MJOVwPyxLvj
	fezwyQiOUfJTiO1woPK00WlL97EYjFYB88YskCdoPKjRzrOqEhyLULyaa0+ajItG
	x8ne0SU4ci7fzSVI3LsJKn0rVXrOA3kEQl1FWjKsneppWLR34V+Tl1EBcO+MMkG6
	gdN4VbaZZhHBeHpJ8NqXhjmFFHvxQ5Dijc8xIvBSM+xOGn7p6xkbHh3cU76wP1a5
	6cOORnKcJW8xNU2Emj+a8bwn+iu8fzsVeclXPl3GhXfAXjinRetfmv52tfB/Lvft
	6X3rNA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3txy9s9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:23:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52b4e315000so12490711cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 05:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786969414; x=1787574214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+OizPuXV21JjPSONb3Hnxw2A9l39gj4FyuXf1WadWI=;
        b=F2UEZm7B569YAWybIr2GQh1pxijF25M0Xjs0Kg3VNzbwyrAvlzB3UDfS2Dwomd2ndd
         HsrEgBxSUfcC1XCm8OtNx5nnGAgB4ZTWor/zqE/k1QroOvaAMyom6LMwVjPMB49462jR
         viVPkmJKbTpWTgqybmhgRiLpgxpudD6YvJCZdnfqH74yEMcRdv75cgmeQb5Vo6L8iVR9
         +qz5GJKBOjF5r7gwOJcEe7aw43FGgeGvevX5SycygJZ9V0HcRRlaHVXW6MUY8emZ55dG
         qtk2QSjKyRFObuglQiYbLkBR4Tdyx+5LqKTXUujdNXfZrxa7Zhubd5AskJUBB4xsrw9q
         Ahgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786969414; x=1787574214;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+OizPuXV21JjPSONb3Hnxw2A9l39gj4FyuXf1WadWI=;
        b=SNcEl8fI59pFa1jDkWmCtaiwHnM2dFBJUB3FktsWbWvhul5zUs842U6MZR1YdhmEoo
         gUqPUZ9Md0f7dUM8StE5ANiKIV0d49vLTLKmOPqP4N3BCCyUjK6CWUaZpNtb7IwCkIYI
         0YTsPGtM2iftc8rHqU2tXv2rcD9bF3DywSRC3+G/6aM3l4Df1amjpZvhm9vj/wZUSHyK
         f0dDN6C8VXhEsMbS/1O4RfY0Sia1wVOWtqEaVL/UmvOBTLqoisOnTtnfKMk5z+Qk+F44
         67vFYN4NWvUGEl4tXNN0wur6o+2ySYu5PPGaxFEsni8rZjKsKEAeez1AuAk2Gy+DAGHS
         FnwA==
X-Gm-Message-State: AOJu0Yw+oQtLT4YBQx8HJYj6ZP4r2Z6TWgE/IzV8kYr7cSJtlc7X41gL
	yFmd8oGGO2BmNyh9DE2KA/uaqHQIQ6PWSPo3GkAC+IKgpOekdPMZ2l3hXVvjjYsfy+j+oOSdd8L
	NYAFSFAMDvGoYvFIVQNer+Wk+2QtwBZz8EMbKOzlJHWh5sG1EzZ/YuB73AgQwwTTuUl6s
X-Gm-Gg: AR+sD10/MHmB79g8ki8AjFC+Zj7ATw444qUWkMWTr3ngHhIuI+DZihV1mLrRPSA4XFd
	hKpJ6v7n+5ZE6eFCsV/MqOZvKLEoyA3MSDHjICCwVcnxSAEgI8YnKakUfJ0ScGjoXQrb+pFAKfi
	LmjQnk6DYo+Hc7tdvOyyn0EYiQ1YO6FORm2CTXpO1tXUS8+/8U54FGriyQ8d0GavvRiZnhjEByf
	+OscR2H+hcoo/f6ISUmbscOXvAsB8DoME57igXTrvAA7jGNYAuuf7kn5cLXhqXlOxcdjyJd0XCl
	RD1DPZg8Z0YVeYEXZZT4n4oCxHyNiPRdRwUNxYM1TDg1GNaleglwuySiCj6+qRszPVQBW6Y1cEv
	AgOvX4DYs8PDa82me6GrXIeGA
X-Received: by 2002:a05:622a:190a:b0:51c:2324:666 with SMTP id d75a77b69052e-52d85425e6fmr199864861cf.3.1786969413757;
        Mon, 17 Aug 2026 05:23:33 -0700 (PDT)
X-Received: by 2002:a05:622a:190a:b0:51c:2324:666 with SMTP id d75a77b69052e-52d85425e6fmr199864241cf.3.1786969413180;
        Mon, 17 Aug 2026 05:23:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b1f23dbsm4083481fa.39.2026.08.17.05.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 05:23:32 -0700 (PDT)
Message-ID: <22383df4-2394-4374-8e5b-60602bcd566a@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:23:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/msm/a8xx: Add support for Adreno 830 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
 <20260809-pakala-gpu-v1-1-207ad1fac1c7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-pakala-gpu-v1-1-207ad1fac1c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5NCBTYWx0ZWRfX308syttYkO4s
 G3vY2HMUP4TxhFTBPUDBy/0oVjCaYg3cx9K71he/RKWQysb5dZq4rrjz63dXXES5VeGCabEbG7j
 Axrz6XKceIAa6iov+HrrTZoWi73BWPg=
X-Authority-Analysis: v=2.4 cv=auGCzyZV c=1 sm=1 tr=0 ts=6a82fd47 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qwKaBMzKsjHvBPFrck0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5NCBTYWx0ZWRfXy9c4JeQsk4Ub
 8B4ZKhSab4zVSzf2o2rnvd8qWCjPJHiaGMk7alUCgkbOfIuY5QhJBWRVIXAmOiSwXdtDWjY6nfY
 bw8yVgkxrakW/E8lm+E5EX7IcB07dy1RIzLxUU39JiHCVKX843iZkIW3rj/n7FkbzHP8UMW3jVm
 6J+BK8ZKqLSLdo1fLjU5Y2sDd2tnSixlZzolaekSHM4BupWWQYeMDlxl0TaMXP8ow227vs/OVLb
 c/D7XonTqgm6OK0ZRT1e9kltb4xnrFFbJy43M6Oo4lsRLa5BOdVeZAMkQZjMPS2tfRGGrzqS9RL
 DeQZ1YCHMGtWZ3s4boCe65vRyjGSgxcIM+TrCg2DaUw4DYz+jU4x2ReDGgzBKHJY9/ddbguq8AU
 lg8XCbPnvwsHIhHSP8eyRNtfkS+yq/NwyLsE74hRVHMmFlZrd8xMlaXOsbKHDQxj5YzVrNJBRhG
 flK5GUvp0M09+U8eTHQ==
X-Proofpoint-GUID: Fd1XZSBzzDQDOEr8jDK2ikAQCp5145H4
X-Proofpoint-ORIG-GUID: Fd1XZSBzzDQDOEr8jDK2ikAQCp5145H4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170094

On 8/8/26 10:23 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Add support for the Adreno 830 GPU present in SM8750 SoC. Adreno 830 GPU
> belongs to the A8x Gen 1 family and it is architecturally close Adreno 840.
> Add a new catalog entry along with the register list to enable support
> for this GPU.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

All matches kgsl, thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
