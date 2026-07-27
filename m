Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64943E5A2A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785155755; cv=none; b=kPCyIxkQNRIfb6Z0HkvJCEgwjhS90fRw/1E5I0RmNKZsywVyY0dnlJwOxOmZe8My3yMII+y2ovsA815k3PV+gG9IbTrMJjJHvyag/8Q9eq20aI/+lLuVjiHdyDIIKhmOqw3DazNzam5jPQUYVrzAbAYKJIAUAt6LqeMfB7zhAkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785155755; c=relaxed/simple;
	bh=lXEuzB3RYCL5buhFHGgoiK/09Sqr7HNhA5jgzs+/iac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/s3w18aBYTzXq+wXR9lneSQUR+i92MW6l9TmHyokYOxGQ2tG0Rb9nEjD2MeYraApu2zFf+jOc0BEiS8WrCe3h3lJkWj+cLH65hJdvS8Fpi/nsc+AWPQpgGX6fvKEn1fzMmkSWAUNV9RuzAIrX7pELhFG+MuKePd2tuQUjZL7Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OvlEfZJa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A4tKCqT8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OvlEfZJa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A4tKCqT8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAMR873594250
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:35:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=44rzlthw92Pyb3IiSzSQiDvH
	WraFwPuyNqv1IZJTnr0=; b=OvlEfZJa2Gb68W5vnOidmz+1rY7r3EwR1TsK6esL
	APGXdea8+9tVyHs8yQGHF79EJ9vB1o7oM5tkOQbg2VmmnAl4g2L4Hogu+o1Jq0pQ
	Hl5xDaNCJtnQAqTl9BQpU1p+JlYoPGBbeNABgvpqZErCs29WsCvuUmeor/oc774y
	pQl8Kr02kzLsQKIdnv/2FpP9MtpyWiVwdzAE+LE9Xsy2J2FngW47uTv/junf8/M3
	KWWbLvr9ssvqfhwGLZK9wtPcEb279z0UiEgMeBg3sj48POOil+FL6h1l8RtmuE2i
	8ePEY9kzaAlWC3Aaj0oDbw8IpORtKdSOidkjSr+wAaktKw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq0pjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:35:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so1795189a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785155750; x=1785760550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=44rzlthw92Pyb3IiSzSQiDvHWraFwPuyNqv1IZJTnr0=;
        b=A4tKCqT8bDx3qmhRALtjliEIJ3O45sFgBf1ln7o397LMEuaTEV8ABMgCHvSowFxQLK
         inO1mc5BaGUSqGkibOW5WfHH7m/LZrqxR1NABdiku7nH7ALqvWz5SP0XQHJPuuab6dSL
         1n1cZQ/CEnCCAsd3jJ3OrA0PNBDkCQwbHHOUIlwLizpeI5c5LAqyIYjNA5R8zbfGLSIY
         AIVE6+LPJY1L9OPx+JcywyygVLqQFBp47VzBfodH+ekPEfLXtabq9t+/AVaiPPacZlXr
         OZ8TaUYe48l/VbtyMn6McY3bLwb4grfJY89DvqNepekLT5bIznicXGKl1UKnSkv09uAE
         Nnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155750; x=1785760550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=44rzlthw92Pyb3IiSzSQiDvHWraFwPuyNqv1IZJTnr0=;
        b=gyNXQ5Vz0/5fhVjNSNKqBlwh01jFOiqxqiblihhhtIVhIcVUpqai0YXxXY4Mzcgvee
         neQovOXJxM1zEdV+NqkRrLCQbE3Bmrot9IBOMA/QEoDn6TLqUw+VtfRv56q056a0a9Yh
         9Eg5Evq6d0EUUHztKar/vf+TsNvfCsLCrfxslmlUC7G89q5JY3GwVfsw3CfGqnuU0Gvb
         qUlRrFni6KWxxXJNc5uv0zrxga7GK4sE+PuYch5CfoeRWkjqfBcH02we7MZ5sVsvAvBa
         6Pdcm3VUVbzZQHsa9olS7o4RJofuCmKhPXtVnHWjC31aLVCy3ktw+3O2rXdkOYC2qTIR
         TaVw==
X-Forwarded-Encrypted: i=1; AHgh+RrtPivwLSXD7aknljoAFsFqzl3vjPEJU9XqNh37FkWzg6xnoHMc3XJdoU4tqfdtSWeDSF4iWbGbqzf/WBZm@vger.kernel.org
X-Gm-Message-State: AOJu0YyyNUAMVdRSlVVb2d9Kq/RMs05NAAGAEB5cwb1vQyMOlCQf9jk4
	zPemdOgGqIynBIadMPKFkK9QPkzhKEMDlXcyOUM56c9ghiOHj+76R9hJq/42K9rHvXb6zwIRLWF
	F6yUWkPK0ChWlRD375JwXloXpYvjEdPDAOiutUf9uGExgwpzzdDFc9NYJcdozteWytjv4
X-Gm-Gg: AR+sD12YZK/GGNG1mDH8s087UojeZvmRrQIzT5uUbDY/EBqGDbj6HJ04lShFBzs9E5B
	Upn7SOapjzTBXq/aGf9Zpgak6mIN+cJW6nN7erLg7FArbWWdkMLkEpraOk/J4bXbVvAxPCBpjwD
	qfQ0gFm3lzqaADsuKdjLJ0lOMW1PyHUhx33ABRqoTZINKTYYMs9LaMMuo52cMhLQTu3Z2l/sM11
	F3F+WHP0Yr32+gnYT6D9Zs26zVKyB93raC2E8WjaVpIGIZ0SfjK6Otm/Veb5+8qCz6AQXKlP+fI
	PYxTEQjyftK7PPZ/nXB+YoRtpDbiuhodOX4ai078iOFBrBfKLMhVkqJD6XTR132L9mUyxNT5JWc
	8DE70+7LeMM7ks5R1B1oVDIGGoQg=
X-Received: by 2002:a05:6a21:3990:b0:3c3:890f:6d75 with SMTP id adf61e73a8af0-3c67d9b4670mr7490803637.2.1785155750453;
        Mon, 27 Jul 2026 05:35:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:3990:b0:3c3:890f:6d75 with SMTP id adf61e73a8af0-3c67d9b4670mr7490750637.2.1785155749813;
        Mon, 27 Jul 2026 05:35:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a04b2sm29439425eec.28.2026.07.27.05.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:35:49 -0700 (PDT)
Date: Mon, 27 Jul 2026 18:05:33 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/3] soc: qcom: smem: Use 'unsigned int' instead of
 'unsigned'
Message-ID: <20260727123533.hz53oknuy3xwzw5z@hu-mojha-hyd.qualcomm.com>
References: <20260727-topic-smem_dramc-v5-0-66188b3e338d@oss.qualcomm.com>
 <20260727-topic-smem_dramc-v5-1-66188b3e338d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-topic-smem_dramc-v5-1-66188b3e338d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyMiBTYWx0ZWRfXw2q5XIqMCKTj
 dNLpLXb40eS8RtoLgFKmsIRUDPLoARY4gvFohDI2IqUN/n5BvTAYIxH2yzdqEMWdoBGOahFSjx3
 KSc2SO2GwSmy2s4uOAo8QNEQN6fSjws=
X-Proofpoint-ORIG-GUID: Ut5QralqSmVtZuFWa8r8oHYDnyGZkuLK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyMiBTYWx0ZWRfX8/7D5WzUaZ24
 zaHHEWDeySV55wKZoeBimfdYslwtEcVn4MchxxXMGMS/azWc16KfxDXZDgbBgxMOnAOs5cMvMKG
 IVLVtwOl+y/68wpJpDjGrqys9lue6GUxX9IyBSqr0fdlGEM+YpO2MY4QhV6OWZlHWv1axZJty2b
 CHcYw6+sSK+2MbsNG2xeqjPzAOvnAtX98YniQiMEfPaGy0oUHuO1bkOqamWgW584jtMc8erUP6E
 4H6lRhpHVAm+LhJMm+RT1ufxku2UNtOgqkAx5GaXinkhNX+d4rmQy8xQ+4FlKIqAGzQZG3VrfLw
 i2HBrjihZDKYSja+UJK0NWlZ8R3+N1x8nBB2s31ccOJLiNQzq9Zx3o0K9gVWCkElR/TyJW5kcZi
 qBoZrcx65szuKvbohilnG3x4vR8NfyNQ/W/TkDZQAQveYS4/nySAwkbYuoiivXD3L8+KeJPXUwt
 1rfCGhevaYEN40YA2ZA==
X-Proofpoint-GUID: Ut5QralqSmVtZuFWa8r8oHYDnyGZkuLK
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a6750a7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=EZmpetop0t0RzpqVzL8A:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270122

On Mon, Jul 27, 2026 at 11:59:27AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> checkpatch.pl reports:
> 
> WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> 
> Convert the SMEM driver to use the less ambiguous type instead.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
