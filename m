Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE84F3C4563
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362781; cv=none; b=VK052ZojWs/5b36FJ+WX5a7rpPB7Rih6LoA6X/SQ96eHq8IIlqsGdQqz5qr17y8ZwceTd+FzxPIom/2qHisXd2bq1fPqrVwLgdAXj8frrubslerMtJWrSOK2jfOXvvVWn4IQnWHj7ygV+/iLafvmwESmSyIa4bb0PET72zrWXq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362781; c=relaxed/simple;
	bh=z5A7qNBKmK97pO7UrB4UHWA53FzsUZYINMOzb7aSxXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ph74uHgCIsbIoqHaJ3Xi9Dip6uqTry6h7pMIuh0inN3JSz9iuG2uDFiHKK4mUJv0aU9V1oXELqS/UiNEClyuh7U93fZpBSQ46znfqzUFZCgdsHRdGjctV2UfAIEuFWpoWT6s5H+S0az+NGk+Sc+hFFNflX8gVNeRdfboAY+rXk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eUT+Fy5H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8yCj3qm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUT+Fy5H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8yCj3qm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9S3l81189557
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ssg+iL8SDOereWInaWw6CzWc
	el7jw2pHpojIedXFuv8=; b=eUT+Fy5HrLeJq2ZwypZXYuNf+sc9CQOQPMJ844rC
	umS9n10T80bn60/06y/atBU6mWqArhreC47WRJUhwVZRtr1zR1aZLwbwixZv7EYL
	xVO7RLPabBr6yfTgflNcyu5eR6oxp1GH1hSHX3TKhxmRTt6Df4q5e7HsoTJ3Gwxg
	xyhf3ei1rRdbuUS+pRlutDvcU+j7mDgUQPgZDsksebWj33Gno8tjMzxZWr6f37HG
	Bh6balEPOoMnkReWyh33W8QFFjjwtY2gl0YqJ0LJCbD7ymH/K8UPOcWsK5kSFgG7
	UEN7A1NftdSFwVg/p53htRDF6fjGTmZPFpM9LXOjkYJKdg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v29e8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:52:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8b0a08d2so12065931cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 04:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362778; x=1786967578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ssg+iL8SDOereWInaWw6CzWcel7jw2pHpojIedXFuv8=;
        b=U8yCj3qmZ/AwlLl9LE8DxSTTvWquL0f0JsYxNYjb6gM5JvjketWajBOicKEbCK37xD
         yGxVBCzxFDJBva4q3hGNbDmE+tr8M5ZfMxuTZv2GFio+GhcueaIYl+9pTgUxdxQ0qYOQ
         nHMEVYw8hlh59FZbeCXwzmhhd1Tl8rRUfw4ssgtf34f+npgNDbKxCw3/mKQwa5DVno7g
         +30f/j2HnivxhGweAH1Vh9BgBLFriU+4w2Y+Q8+XskXhmhyU/APHtqF9rj1fE7Mynrk1
         FXxKOqZBPY0gU8nIzMJfVjHXatQMRGTAAjtg1MrEC6AgnNVvuJfR7TjODmDhODhjdCFJ
         jTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362778; x=1786967578;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssg+iL8SDOereWInaWw6CzWcel7jw2pHpojIedXFuv8=;
        b=FDfLxxd1BR28QfrhswpuyPHKrRsheXFuzl7sXbSx3NhCcd/MXAo/KtGPD8UJ1lzGJV
         EALVBTgzGdscR+4hRh7mIAavXfe+njQoYTBIwP5v1OjA5zWDmLVODAosFns4Pjus4Eel
         M4vMHrXssST+07Bt3arAHvKiKw8RgQFbGuodhh721y3knNXI8OiE4U5wy0KpxSQzQzbm
         1D4/t53ilvyj8LxdF4Y8wHxt5tQ4bIqkbKzW1cqW8ER2Qlo21bi0To3EveSfEJE9BnFI
         UYGIuijbqXMwnQ8NxVd24K6B74Es3ulu4vy+Gu7oEb5+gZG4YfD2xx4CucHUdviLtVCS
         OO/A==
X-Forwarded-Encrypted: i=1; AHgh+RoWV8O2MRCpgv5lXmSJ9NoxQQXggM7IeJI4UyB4b+xZIkQjPEf9kPZUrgm7wGRe6pApt6qB6ZF3F+LBlpOP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8TVg8e/W/bvzxjwPFhjNz461fOWcsE4Z/kdC2MiWt88tUV5Mj
	k28dxtcGqKppLn1DjeQUpSeCc0rOM7B1xFr24dmFf3Y5JtPa/JJMbCfJxu3BoKVtwahll05bsWI
	u0ye3+y+bPazCugavgyCRM/txcIiseHCel51zYo8SDevusx0hp9E8xsHhw/7WsmZKrBX8
X-Gm-Gg: AR+sD10kRLTinMDQ6KYgYTwby/ByKPmIpncaFJsDrBoQZLiKTCift8SFKB9nb3FAny4
	cLBKmFOP6V6/lwBObJVikAJ4501tiG2xksypm4NjxcZiZ2yS/ZATJpXtIOkA7yLq4NY9yD1Y6jd
	7TfYrGLnuL85fMiXBBtBPUghrDbNCH/ersvgKpP3J8I1IzPwS0G8Lw0zLVtflkkT6uJEt0psKlO
	UA5HOAr5KfmxVIKVUjuC+Meb1B12i4Dkh7+2wnLjefJvSmjEfdTxXbWXgNK1yzmXy/JAC4Srf6l
	GwXcuhczemXTdiC6BCbdAOLCyvuAESVEtnDIzZPexKlmuqNX0bev0Pi0dy3xsMi5t7I0lrYcv0P
	dF3G2GAqgkb4=
X-Received: by 2002:a05:622a:4c14:b0:51c:2633:9ddd with SMTP id d75a77b69052e-52ce61eabd5mr473507951cf.41.1786362777779;
        Mon, 10 Aug 2026 04:52:57 -0700 (PDT)
X-Received: by 2002:a05:622a:4c14:b0:51c:2633:9ddd with SMTP id d75a77b69052e-52ce61eabd5mr473507401cf.41.1786362777165;
        Mon, 10 Aug 2026 04:52:57 -0700 (PDT)
Received: from oss.qualcomm.com ([82.77.85.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800220ab04sm31425905f8f.37.2026.08.10.04.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:52:56 -0700 (PDT)
Date: Mon, 10 Aug 2026 14:52:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: hamoa: Add ICE node for UFS
 inline encryption
Message-ID: <3msd7echul4af2txjfserdbnedh6ukvzxqwiismjapk3odgkby@uoxai4e7wmhu>
References: <20260728-hamoa_ufs_ice_change-v3-0-293c7c6c2ae5@oss.qualcomm.com>
 <20260728-hamoa_ufs_ice_change-v3-2-293c7c6c2ae5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-hamoa_ufs_ice_change-v3-2-293c7c6c2ae5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=S9PpBosP c=1 sm=1 tr=0 ts=6a79bb9a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=GMu+mMXmPKlJm/I3Pt7gOg==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=SooqmcQUKh5i17ny3PUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: yV7lt2I61EXdduFfY9jbTAS-xVCTQV1h
X-Proofpoint-GUID: yV7lt2I61EXdduFfY9jbTAS-xVCTQV1h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMyBTYWx0ZWRfXxiUen3ch8O7b
 raYWKJCwcZ3IkLm3TqgkeRWaH2qfs3oqecCWvuUvpaI3iGks8Cld5aQVW4kxVOCof646fb8rgKV
 XkNYVzmJZPWAosAwkhJpJRPHcheHszO1BW0UpdRdTdKW4OhX2Goys6jhbtjzLP1jcS569z3uLaA
 A3R1RopUYmC7TeihWrvgh+Gz/mLviF2+FyXlXQf7aYjfmoMlGyP05oMMNWKRQ+fHg9Ppuvs872/
 wr1Rc6Vadyb3b7ThvZ/9WhaomMhuvrI0ssMCbkYE8bHDbQhxILEkbkqXzQXZF/THnCWK2IaqnOv
 9XAbOpmM2LDH4h4TFpgeRXGbHh5cYKh3lW6YcEcYVE6P0y/JPwZtkuN8rksVJ7FV24WhUsGigUe
 qdWLpkVjBqjQjPmJ4Ehn924ciXOfTFXZvl8FB+/psgYgPhzN3mWBvIdjufrBHd3wmR3qKxdCI4P
 zXzcutLSpbbNzo8QhMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMyBTYWx0ZWRfX2fmTPAj6swr2
 rliyaBimBdDr6W4uT9gdIAt6LJZcOgk5TyBWRZRBUAgEx+ssBK/ZbMbvVW9fyywg+hFyExSf53S
 22ejBDA5kdH3UuiYwzzZOAl5SW/HagE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100103

On 26-07-28 17:53:56, Wenjia Zhang wrote:
> Add the Inline Crypto Engine (ICE) device node to describe the
> hardware-accelerated inline encryption for UFS storage on the
> Hamoa IoT EVK board (Qualcomm X1E80100 SoC).
> 
> Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
