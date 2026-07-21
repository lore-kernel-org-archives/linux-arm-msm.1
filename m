Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37BE43B6E1
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674431; cv=none; b=M2lwdeB4pUq9OdKxSS6b19IOy0XkKzfUZs+vfuhTEm8578ZwoVD7bVg4BTjb+23QvPjd1JylPrW5VrlrmNB9IDTUo3KIB3kOPP3kGE1CJBseSrpUpNEwJz+xaEoXfepIhsVkWop6bVuBXMxVWKVQ/bCayIFRiA18N7uF4S10SQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674431; c=relaxed/simple;
	bh=tDAi4IGtVx/zfl8u1l7AFJDNu3zxE0dupcP26fR3FZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dv1CmG+gGn9yKSY6h0YDhm0zMk3d0zzqvS+rBWiopm5Tw3i+VsEv312VyWFLPD1xgKn5hK/Gh+l+OSGd1vDO+1QyvoqYppo/s6HoRm+TnB5SKH6ZrhLi5bd3H6r+HFmru4QCbz+L/uYai/E4lSkfSeOulQlbwDJpmND+DQxTPeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TmJh7sO0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvQFAl1F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TmJh7sO0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvQFAl1F"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZ6gH3136831
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mo5JOHCdyujbRKvDz9XZRfjh
	a+Z4tfZA1s4uWqbxDko=; b=TmJh7sO0lGVISpcBmTjicWZWg9ZypS6ZdD1NdWp4
	SOAh9jqcjoakNevBm8c7yCGxLXw4l4W0Cj2lMCJ/cNRu7/4VZLPkioMgEiumfi8U
	PWiYHq3z8/hzIdGmqJlhml8pzd39f8Ey2xvWJ4W4MaLREMhPcbILncq4t/+xR2v6
	i3Oc7SrqjhN0h2WOWU/4aCLMHe+GIQz8NG2wEYoI5Re3VwEUzG56VDajAyduSyGj
	e0kOCLTiiFOKcfHEO426YySHMt6xyCZgbwNPC8YkMvAKtXsp0cmKbmWig0Dt5dJY
	XfOQjxC3+pkHMk/wKpP9cCSV4s6PuSWwkhtKPafy5+YOyg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d164w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:53:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a87ef9713so79723921cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784674428; x=1785279228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mo5JOHCdyujbRKvDz9XZRfjha+Z4tfZA1s4uWqbxDko=;
        b=PvQFAl1FEtI4V8lu/twZM379uxpGi+PMHCud+S6TikrHY5ieazQa0I+XdZ2uzCYAWQ
         hs+tusK7kXFkAGpCcYDdd6CBta7VD9aLJEtT9a0FhlEdg2OBEvYHR8n+pRxFYpNPjRk1
         UHsjMP4ytThma1m4NdODdAQvjcQoF8R4VqnnjatvnGZ5XKUqkByndtH+2kz/oBG9TNJ2
         PYMX2nBJsZIJYZRmKIygD7C0MSh1VRT65RXC9B6XBcLrVmFjHz07/uh5cUx+oho15Gm6
         eTs8hTKWNH85ALyS2FdmDrwYaPW7XCAUWK4qEWcXvDTSvAWGUMnQ5ophpFpUyE6Mjgsx
         X/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674428; x=1785279228;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mo5JOHCdyujbRKvDz9XZRfjha+Z4tfZA1s4uWqbxDko=;
        b=ZU6pNj99eA++/aiXDEWp++aPLwYkuuI/hAxXx54CbrtTxkUMh+TR4R9IGu8J7WM4q3
         Hv9LGUgOI5Bky0xmIh7KoDSQD2KKsnlj0SHMaw9OGbsIQiPjqm6TWyJvwHa/uuKddXHg
         VRPL7uYs0TI64lSa8DbGmvDoPwl0ah0rNVDZtbzaN0O/3WuyV5rpMhCWIk7gHc9rkfMz
         GKbZFKqQysNsSuzrluX8/7sNei4Kzaq9hQY/BNaYCcp3htI6unEkdNXNg/bIyuAmDyi8
         mv8t1U19cgbalPC0QiBG620yl+bKwcMWHYishpjjowUGk5LDObQl3w257PQP86G0k0t9
         66sA==
X-Forwarded-Encrypted: i=1; AHgh+Ro9PUzJLAAva7b8qmEedBKn7yZYSCZKDSWQnT1ANp20H2jM4Gq7PMFmjS9H9K0diUfL86G1Z0S7DX3D7ujx@vger.kernel.org
X-Gm-Message-State: AOJu0YxAWUsOj12E+JHcLIgcJ5ETWjn26WfgzuLhtrvfVmBGGMCYBW3I
	PI8Iyf9kRF/lIs27CccQ9GO5Sjhph5dEgZxS795zp0hAwkcnNtP6WJFsDco8LxMyWNqJn1ME9I/
	Ly7TIlcpQR5dWY8Dae29aHbmPxXZQrPF5Lat88+xtFKbRPAre20fnzu+lIYDKisTDmUc9
X-Gm-Gg: AR+sD12CzPLi6XVAI9TeYVaazEWc9he8iuFZM0rqrgsOwdbZtg2xcsL97A0Xr8bvx4k
	leUdhbFigSO3n5EpqbKlMQymYZTJSaEDhp0Njj8a/JT98TNVOqfn9jIEL2ZWmYMkkNPyZEEwmoA
	/AfSG4Yj2XyBpgi2fAYTBBFpYt+iFIYxhzksEQsQhoR+QJLAEVmxEYiQtGmHWn3EAY66UIMF/mO
	8btKFh/fTHjkAVI8A/uwwzeBqMTA9BfUENltXy+VNJiUgptouxMNV+2T3OsWfbcEgM6gnCjNQNd
	epCotmUxSAib10ikrUlATmyfCyxrV7fiIN47T7vHlBg9PFgeXnI/po5hbcpcD4zu1Pld+AvLu1w
	cyORPIzMlOaDp2/q/fnWOU02TxbTZdbuJ2stXqRlKvDmUC+Xm8H0JL/vvBAfmlebdqW/tw3bgZr
	F+DwXXzOFqiexe4Q==
X-Received: by 2002:a05:622a:408c:b0:527:7122:3f2f with SMTP id d75a77b69052e-527a8b482bbmr18157391cf.31.1784674427812;
        Tue, 21 Jul 2026 15:53:47 -0700 (PDT)
X-Received: by 2002:a05:622a:408c:b0:527:7122:3f2f with SMTP id d75a77b69052e-527a8b482bbmr18157221cf.31.1784674427399;
        Tue, 21 Jul 2026 15:53:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b9b006sm151389e87.23.2026.07.21.15.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:53:44 -0700 (PDT)
Date: Wed, 22 Jul 2026 01:53:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] phy: qcom: qmp-pcie: Add support for SM8475
 Gen3x1 PCIe0 port
Message-ID: <ipdehqlooopyymdvh4ngojgams5r4yut2ojlchf6e63xvnt4tk@7xmndg3cishf>
References: <20260715-sm8475-bup-pcie-v2-0-48bd91a19abf@proton.me>
 <20260715-sm8475-bup-pcie-v2-3-48bd91a19abf@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-sm8475-bup-pcie-v2-3-48bd91a19abf@proton.me>
X-Proofpoint-GUID: VUsQxLG-UDRYG-KD_eyTeaArUG6rsYV8
X-Proofpoint-ORIG-GUID: VUsQxLG-UDRYG-KD_eyTeaArUG6rsYV8
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a5ff87c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=pBVXu9Zvf4h7QG-lshEA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzNiBTYWx0ZWRfXwcSVy7bdtx3u
 PGbSgS867DFNVDxNS0Np+nXI+o4jhqXUm3D6+fwcjfooRxXB7zBql1Q/Ydq0+rIAkCUx8b95LhT
 lqACkGsvb0yIOVz3B110OPxjIAl1gdspYS5Hcb9ra0PgGxB9OwgSgQNzTizw7YliYPUjnEBXokd
 DhFSS3KFqwb6xC73OPqzkY4dsmorFYa29IdX0rHHOE95HRN9kOX2xjfD3GYB8WyhGfy7FJDAuZt
 qmqZrAAltbrD4ONb2A5DUKViSx0hlzri2mJgE+I5gXSQydzVF0nZb6e4/vzOsGum2Hfzj3YdD2e
 QquyV/pggFrMqCD4niZZqWDoEksiWWboHK19NMwk4CplyK4OiU7HAJmipKGqJ5Z2SxoOqGQh8Yv
 IQJT5TFk2Ou2tC4LxlJmSwIl4HA0JY7EP9x6SN23AhrV9AmVBqCwfKVq9dVwes1hRurHI+/5KG1
 RLbsrnKncZYjVHss6ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzNiBTYWx0ZWRfX76jK21UQWKA3
 VWvhiDUzbBJ3eKYB22eovEQROdJRxw5Va4pD2Nj0kOhGZcLBNbb9r/SE6plPVmClUgOqs+M3Pam
 n+3a2uMsUZGV7mWC9bEsEVqP72OtbVw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210236

On Wed, Jul 15, 2026 at 02:37:48AM -0400, Esteban Urrutia wrote:
> This gets the port working. Tested with WCN6856 WLAN capabilities.
> Serdes, RX and PCS Misc tables had to be added, while TX and PCS tables
> were reused from SM8550, and PCS Lane1 was reused from SAR2130P.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 108 +++++++++++++++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
