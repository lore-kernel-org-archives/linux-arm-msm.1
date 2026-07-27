Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F318730C152
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162374; cv=none; b=sSqFxNAQsJwSFqYojPG0iEj4RhpeFTQ6Og+QgOeY0wc5yP23vdmnIGNWOLf/S/cAC/JXoy4L3oQ9crtMh8lsTkTHZbQ3KZogQICfVTiqSPtbJH9v4gdYPvE1TA7b66/96iZRs8gYXSlo0bo89OltedX3MtgfwS65+2RmE0MwlRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162374; c=relaxed/simple;
	bh=xBrj8om7cZyJutOzs5H4xLwjicqpb4hECpicCs4d5Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YpJmoveZSNNgjW2GJU6HZLaXzjMI2QdRT1br5q6aXxnLnFx4bINKx29TlftCDn2739vGXQG6+u8RW+uF2p4DHwU6i7p421CuJoyogTyOZGBFj0uQf6LZ7VSbxgR0sBxMW7f9T7UH38e/pFBYEG9pN952AVwgt3QINrzL+Q5EOaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fw39adlV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmZ3S4mR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fw39adlV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hmZ3S4mR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlirJ4061200
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oy0mH4sOH578efJ6Gq+6ZULd
	BJ7VNf5OuMq0T7ZLoOs=; b=Fw39adlV1Dw8yAT9DITYXrSv26tgBA3e66fmtToj
	mEVio62D5SLx4V4uI6n93+d1Xj+TGTvIRCZcvBCPWqBTFzLGBv/RiMrHv44f/zv+
	QQ8qAIVgJYIeWVj0EvXWyJFYhXyacy0MUJrDYvQ3D2qREgMg3hoWvu5BzlZbF47j
	NvZGAzb1mfNwCpP55/rKGOzS05XRUFsgIiRdTRE//Rekd6dL7lpZdjAKEbIg34Yd
	lDlGv+aAHtDdho7apKCxjgcKbljJ0WS3MK2LUgiKfOHbcEoLqqxnhvrQNzYJXDCy
	yfWGp5Pno/s2bqeEidhQdCjqNE+wndeiX0PMW/q/pQn8QA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq157t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:26:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52769fc3f2eso34046591cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785162370; x=1785767170; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oy0mH4sOH578efJ6Gq+6ZULdBJ7VNf5OuMq0T7ZLoOs=;
        b=hmZ3S4mRIG7RedK8Sjza+l8w+50hMFUF9yWQLS/FaiGBza+BMeJsHhpJMrvJxIAtGg
         rXvGFCvMdK3aHeaPx4rUc1hdNEWmR/qvKt4hp1FPzVvXk0JWg8pf7p8iXFKOYCIyM+vk
         EnZ5+FIgWzyO/ZjQeGnYusz77SkDaby5jNHuE+zKxqN2g2JfxuJRw/TiwcYh7pRVweun
         G4t7XVekzuV6BbZKg1DhukyZd8ITGl2kPCmSEz/31qtRkpzgK5NWlSXkvNtzT37z9rd6
         3Bdo1PqR5IjxocRzkqNxwm1/01j9pwSXrVeuIIcYeuWGJGv7CYFrvpz0mmwm7tvBGwXD
         I7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162370; x=1785767170;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oy0mH4sOH578efJ6Gq+6ZULdBJ7VNf5OuMq0T7ZLoOs=;
        b=TbQV5RfRg9jGBqalynLJ5UoW7o25Fl8R6NLmzI8XLFzYbZNoJM6QRyAdm0eYh2Lq0w
         PEiwIlinMoTb4sHXhcjxaRIB9gxw1Ui+EbD4zBkiMWxohejQA49Cj5h4VLX1Y+KQOzAB
         HUdrRZvX9Mk6hGeVg8THZD1zWJdksDkm6u/KAf6wGTFBjzGFeXTqpK9oUFelrpwjcY+s
         C+PTpsWuBa+Bzqx/NGlHdriyWuHGYIqULVDxPRSKQt5FyykhJK44BscT4CnUUNgNRWOu
         Z1G4niR46XJpcWk2vB9Gv9S81LR+4xn2d95JpLPJszxFZCFhtBOJr7EPvitSkthiHAFn
         UQ1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq8mi1j+LI0hYvEUhRoyLJuVh2Mi+AcgBdcHOsJECMcU6blzy9zr4Qd1NfuYhHYWqAAhty+I4EAd6dwULy+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8g0uxydgHM9XZgaoZ0+sqMBgNfgidF/IfqOXgpg8TEqBM9WKU
	P0PtBQ0zXaHKBqS+M4kNw68N4qnnBM2kTuP4hMI/+glgKGDHyNvSMNz9pznsAAkugvFbNWgRMNs
	qGCMGikUWv0HHL94WbLljJY0Jb63MVchAcUziDdntFkj6E0+6Oqujxiv70K06Rv0oAjQ5
X-Gm-Gg: AR+sD107IhXRo6VqX7exKCEeC/180CeTy4bWyKPMu5CxK31Lm1MPnJzI2Sj06Ly1WuL
	Aht6Uf8coC8i7E8edl8prVO7RevjhC5xPReWx1mXlTiF6QkfKg7iRf5BNPlABSTHf4zODv6j61B
	xwrl6uIJFLTM6lSw9u+wz314XWLlsSHIToOE+DScbif0+SjxYZYqRZYtmqGVLXj4/F4ijxL33KR
	jFUhmm/CA4izYdVOCiWElKxCUp7iq71fRLS43n6dKmBqxipYNDNJORUE41DB3cOdNK4grzpNJeR
	LJcEe4TeO194b0wTYs2YmdYhjmicxh9JYkhRZFjBdKBpz4LbBpaWclKzT/lfYDmL6E158Ncm62U
	h0upk2u+AcTpxRKo=
X-Received: by 2002:ac8:5714:0:b0:517:87bc:9b47 with SMTP id d75a77b69052e-529a85ed059mr87169421cf.39.1785162370016;
        Mon, 27 Jul 2026 07:26:10 -0700 (PDT)
X-Received: by 2002:ac8:5714:0:b0:517:87bc:9b47 with SMTP id d75a77b69052e-529a85ed059mr87168661cf.39.1785162369415;
        Mon, 27 Jul 2026 07:26:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f864305f5sm48323508f8f.17.2026.07.27.07.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:26:08 -0700 (PDT)
Date: Mon, 27 Jul 2026 17:26:05 +0300
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
        linux-pm@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v13 06/12] spmi: Add helper to get a parent SPMI device
Message-ID: <tdx7aygeu3li6gjmzsxntg24mgcg5fkiz7c6oibuhucedupwjo@iqpnvtiohstz>
References: <20260721093626.96264-1-angelogioacchino.delregno@collabora.com>
 <20260721093626.96264-7-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721093626.96264-7-angelogioacchino.delregno@collabora.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfX54hk5T6t7lU2
 vqJOHXHm5PLV8qRw9KL+UBEli0LZ/4tvd1Fdme+BwRSRr+20XOwMF6VfVOri0Ztd+2Jlxapt05a
 Hy1n2hq1TBfKE1+Sn1PvgivooVCFjfg=
X-Proofpoint-ORIG-GUID: N9K6g3zy9sE1-_RQhZGOMyUASmMpJEcR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfX5E8MuW4EmWQ7
 +j/TYPMcywFf6DkwOJNhbbWpUVBSpmYbqbkawwqqLHwl5FKDaZ4FsKoP+zPZtDbc7mJmWk70wa4
 VuClZAncRcAzYsSplej2aF+TDyxtsbtLZOMI4vSFohWNO14Kmr9C1Fv7CZJvwRL8ccSTGQda+Ff
 EMBObDzPhojzO+ynqXYTmlLUtm/BfLM5TFytiJlznLpdtjPexqoUotpt2dTqqO/kDDnSky26zbv
 S1Jh68oxJg+I8aAVCz+n5n2xWxEv4+GHi/NW7aK43t/HfjTc/JsUQwu/Y+qNSo+18EtUPxdZ+pP
 n66a3LuYiXVTeCcVOFpiYRXxqeXyewowny1f2gsac3rSsfIj3pajfEikdPGkw+Q5zV/LP6velWl
 50pVRJApD77bHLrbMrCxn+mzMIn1kyiCEVgcwewfTTSDEI14jNqy1XGaATufQc+8tumg8EhH3mD
 XdkUTHqzqmM033AmwOw==
X-Proofpoint-GUID: N9K6g3zy9sE1-_RQhZGOMyUASmMpJEcR
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a676a82 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=vXzjEk_Rc76YdSX0aKIA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270136

On 26-07-21 11:36:20, AngeloGioacchino Del Regno wrote:
> Drivers that register a SPMI sub-device as a platform_driver are
> not guaranteed to have a SPMI device as their parent: add a new
> helper `spmi_get_parent_spmi_device()` that takes a struct device
> and checks if there's a parent, and if that parent is actually a
> SPMI device by checking if its device type matches with SPMI: if
> so, returns a pointer to the relative struct spmi_device without
> incrementing any refcount.
> 
> As a note, in the specific case of using this helper to retrieve
> a SPMI subdevice's parent, the spmi_subdevice_alloc_and_add()
> function does actually call device_add(), which will already take
> care of raising the refcount of the associated parent device.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Looks good to me:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
