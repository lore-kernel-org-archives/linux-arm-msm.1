Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E433AAF7D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339231; cv=none; b=hX0BHAEXO3DWTgRWSaGHgH093wWtYnoTcrBbdiyMQJam/WiiFBVy4wUqmlwVj/ewaLAV2GBdzXwft3VyAMoaipexVd95NhwV49o3zHXhQYlWVsath1VDs3Tj7dTU5d3V2ijns9SyPCw7vQM/0O7MtOKLKr1sqn3yT7Tl7zrqDsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339231; c=relaxed/simple;
	bh=qvVc2UIs3ngSUpzRlpZ1gkEZR3fbSXfz0detzuWTJac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBs1uCqEWg9AN8Jaz7oKD9qxStrSY9HMgNJxaw0zX2vPSAsfhwOxG3vdZQ4PkrI9PZroRIG5ILKKUeQYLLBuruR3QGNRLg3CDg8u4GRNRR0YZRksObxpkMoZZc3qzNnXssPpFZPJyKL7UJtw0Ty9awwKgSIM83wVJvd+Csg5oV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7xEEHtj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UKp9b4mP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L7xEEHtj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UKp9b4mP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2gOU2591874
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ajMms+zzZs+uBR5tOwHZNPSy
	MNLyGmo/TMRwS6asBT8=; b=L7xEEHtjD1i38yrf6/u7zQbJ2t12vUPoUyI+nUD6
	ae/s5RMzWNzGK/Nu7UMp4siroDNpWvty9UlKquAo5likeh7ZvPzZAZiSWs3CVe+1
	JngEKgVsq1pIiJC22CrYztdDpsShfG/8KKBWnZDmbodNThQ7re9aYDwNYT/gfPkW
	ZEE5NyGiiyWei9rER889z+bANm1/H5VEBXrZUFWA0v9Nj4oHgJcsDy3KVSHFkD9w
	fMO1O6Vw3G6pKpIGJkQoXl6FqU7urXrOibEaK/RsBhK7aQKKnXLETCFsGbgtlRA8
	vfz2fj2CzT6LYbKf2XhiKwpQPACIw0LHJxx3yyIKksp0Rw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqke08cfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:33:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8db414c7so16252111cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785339226; x=1785944026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ajMms+zzZs+uBR5tOwHZNPSyMNLyGmo/TMRwS6asBT8=;
        b=UKp9b4mP5lIsV0iqKKi3yLbCtzl3bBtuavIPvBIxXzF6qNgWmSl8ET92wHeuoWYgDI
         cfSnUkZZw97iDOAyvogsmEpzfrF9UCYwvf8XsunLpRpcvcqIfiDULvXW07S+reXNcPCG
         vLdTtp5y44xg0cAB6Qr92wZrp90qCVfWXC1l36G5229x4+Z0SSJ1CbM+QaYW9vb6o7+x
         UZPne1lSD4iYBG7TBhESPCMEO2MIJXaqN7ZDR/J/h97ROMmSTaq+J1qToXdSDhJIi2+e
         JZIt1wD1iXfOZNZJy205EzLIYFmKMnfsYleN+jWvZQM0xi+TGb4pCFjRgbpVKPyXhpIG
         N41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339226; x=1785944026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajMms+zzZs+uBR5tOwHZNPSyMNLyGmo/TMRwS6asBT8=;
        b=qjzW6LD/flbSKo2WvxgDN5O7jieY9TP5hRZ2bUiItkgJ4JrRGTgpswUQmG8lXzVQCU
         u9Kg3nfiuPYQUpfrwktpl10PMzjzHNL+YDwljtwXmGV0ASxPIJqzKrNWhOGCmlVRyi9S
         WIyrgraz2q8AXtBZgnTJGO5npsoLL7lk/3l0KOyP7MVGLOmPVpu/UcQhUHbYNMxWDqqR
         CFhix7uML7ISfofUsEb/W0WHrnr7L2Q6QI0JY0KR9gnHuQI2ANRnS4bo0lLGTrMCnif1
         Df7qpWFqhvEonqCeU7jUkqVSYUNFFS4SkSGdFWzTimOTmzfFb5rXXlkSzXhMYb5BuOx5
         7XuQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQHChOfJwHL4BJrhZyuA46VHYd99tuNo3Ar+6zJSDQAnbU/TVc6XsjZW/r4tOvM9a6NWQcIJd4x2r3FLdo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywety5EiBigQmGDQEG3Fco3k1/E+JnPz4b9G9hEgHUEUQ6FUl/g
	+N2yGpuI3vjffIVPTkgK7QeFcUQvAlaLrrDWmrBtoc/BQXJ5HAaqmO7t/7QhSlXAwruYXiS/rnf
	7OIIWXwljHB3+nKSoAzHxmKzmsbh0vXheUhDFLkx/VB/I2NHUmGi+cIar0ZlFhDLKrLU+
X-Gm-Gg: AR+sD11Rtu533vcpKyHD+ZkNac/+O9/LFeolDRt8Yfwm0Ka7IJKdiR+DSQ4WShMkW8R
	AFFfoBTKoBOp1htUu6UR0zaqYa3K4HIeALIph5ZBzOzJqGjKBjUQPky0pTpaw/hlrRWRMrfPPNQ
	tpXHFwxFoblzj/MvhrQcPvaf9EyW8Q2+D1cG8bUlXDMP81YbTKVq0sG6P4S7PeIeJIJ7bjnBD2z
	ZltOlYJX4eJYJ8fz4jyqWOZeL3AFnfBSM2UZW7je73IdzUku5i5ggNNDCjaJnheVC51KuSAUu95
	6grOvsW6kfRcJmFdYYU5n8c9MG/S6sOtozYoY8RVg0Cmk0eNziI+0axkmo5RptEdqWBqypQ1/aX
	8kVfaJuRGfXK6qTE=
X-Received: by 2002:a05:622a:2c6:b0:528:3b83:3483 with SMTP id d75a77b69052e-529d70fc0aemr69903201cf.23.1785339226293;
        Wed, 29 Jul 2026 08:33:46 -0700 (PDT)
X-Received: by 2002:a05:622a:2c6:b0:528:3b83:3483 with SMTP id d75a77b69052e-529d70fc0aemr69902581cf.23.1785339225661;
        Wed, 29 Jul 2026 08:33:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4615f5fsm156186365e9.9.2026.07.29.08.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:33:44 -0700 (PDT)
Date: Wed, 29 Jul 2026 18:33:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 9/9] arm64: dts: qcom: eliza-mtp: Enable Adreno A722
 GPU
Message-ID: <q6f5b7xejzawn263ipbi7hsqin4c6jqsk6n7h77libdcvaq725@n3jzmra4wgdi>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
 <20260718-eliza-gpu-v2-9-64379dbebd7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-eliza-gpu-v2-9-64379dbebd7a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX2HSO8WEAwKNb
 BNm7ExGo+UcQrdAgY43TFBNQK1KViOpnP3noJCeM0kQMbpLrav0DEyi+vdT+HUzYegjhDrt5fRJ
 klTTTJJzTxMa3e9cWUouuI4xTdxjpkAcC4L26T9KXm56Vwze3St0xZiclLS74LI3SY7wnYTHx7/
 dUDhSiPu0VJ53Qzt0mMTDfuzrbGQOPSUMP1Pz8v1QlduWuqehW1EsZZHfRBb77dyAD3Z5B+n2uQ
 H+D/OkHizXXF+Ifk8sNL2uoUCeJ8MOjlkuMbByZCLjn0JyEFP43qVVsz+eT4jB8sAibDsTs+7uC
 2BlB5Ra8kHHO60SU0qYwlukMJrx65QQINkGWW4CssWiLeXQDlItB2wJlnRXChmXLel3cyyztO5R
 VA0waDvHO8uPTwpZ1rTeH6LvdvjUGYmPHsj2B96W82HeqRXlbvmIea7YnpUJZ2B9a8noVfn/YjL
 gVKIDEbtEKxAEINwuyw==
X-Proofpoint-GUID: iVMqKkn7lkReBAyttDZFjeZ-2rxO3GQg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX6uHJwYRSu5qP
 gKO9SIvorU43X7k05CMwtCz9KOGLApIFFgRDYHqoxMTirs2/vgCsr5VqyapstBs+KaF/e+u2V8W
 xSPD+ebOwyYnJxNzgrV8KLT5KPEE+2I=
X-Authority-Analysis: v=2.4 cv=ONYXGyaB c=1 sm=1 tr=0 ts=6a6a1d5b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2dTW7TWR5CdT-0lf7KkA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: iVMqKkn7lkReBAyttDZFjeZ-2rxO3GQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290125

On 26-07-18 02:11:34, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> 
> Enable the Adreno A722 GPU on the Eliza MTP board and provide the zap
> shader firmware path.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
