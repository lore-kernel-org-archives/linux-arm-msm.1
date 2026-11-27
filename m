Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795812221;
	b=Fmq3b9e7Fk9NeHD2MPIVmOki5NhBRyI5LXpPXKGQU/9JJ1DTXCjn7WOrIyHwBe/hy3AP
	 qPfyhuVFnc5jmcVuF+eKUHSSgk05lE9qQ0kmJQNQfmYU8Qtdk2/uPJVD3/f6NMkbwSq8V
	 1VrGTdXXs9ZYnRiIZ7+kruEBUHXTAV4npQRo5b/0pDTUCWhW2ol98cV2gXZpHNrp+PYEo
	 3Co8FUz5/mKJ0mh0Y8C8CyBA9fqYrsBUzPrPmoX6p1fhiotM3gbhwvizotv5p4RYvyPJI
	 +TLb/gpRxObmvfN6SUsq5n8buMR2Jh55fqgH/TWUVezeGcae2FXK2EYrb5hKQEMp0QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795812221;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DZjBJFtH+WDTVNVp3EGI8H4RuqImBz2xbif9rr5XKFk=;
	b=wiyp7Ih6sevI3r0jNC4sTW2NmKpjX//Ex4EXCqMQLVy0+PJYwSqK5pUdgO5d+MB2bEpC
	 5CvbypDC7rYcdpJPhooY8FyijK+dBhYRRq6GBcY5QH69JPGGLMwXycFbpIhpCNPxc7Pl7
	 xImCtMnx1NVuXlcBHYnPlEUgHOCNzpxruYheqC76IK00LOXw74EqMP1Tk9jOAchL3YfEL
	 9+N65uP+l+6Dfgyjgyw5FXqU2vYq5+h8xC+x6ueCUdKI2ZOWDmF5HxXs6McHDh2gd54ot
	 AADLmVm1ES1nnFpRWk3Jw/KjlKTpadELZjxkq9osLQ3ZmQ5I0E7tVL1KrUMzERdLNwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nJU1P7jj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eaoB6zGe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFADA606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFADA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nJU1P7jj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eaoB6zGe
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJAujO3038749
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DZjBJFtH+WDTVNVp3EGI8H4R
	uqImBz2xbif9rr5XKFk=; b=nJU1P7jjQQrzZV6GVoP9RsuA7xkEKf2zUVRYO+OK
	cylC9o76lxhfOYB9rT4zXcQ9eYkeF7c+6A2iZ7lLHq44cG4WNmIaRwxHftCay7LL
	0Cfwe13h44j6BhSp+4heF2WHS2IK+VRB46h9Ol+zdsYuvg2XGr24RK2JOoNrGL//
	JW6aMowusUCEjqAoZF/SSteFWQsRFLifw6yeo/I7F4BRZ08/JtNsk7udRvyRubQP
	J8MtHCgxABVtVlrvzEZqLohks7b9JjqccumlrA4Q378O7g3EdQnHd8epkszNJYcX
	exJnjhNLiYsFhpKLA27K2qypeC//EtA8DxQBnUIelk1Nhw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7e4ngfwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:43:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92179251e32so57248896d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795812219; x=1796417019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DZjBJFtH+WDTVNVp3EGI8H4RuqImBz2xbif9rr5XKFk=;
        b=eaoB6zGef67NCqhRZ3Qc0BLzOhCPt95vYT2QdiQPizWW2zOfRWvv7f3v1B3SCBPsGl
         LyO2EhV1e15+ts1lmv84TDzlqnliD2EGnGAnpm2h/i1Xy0Sa4wGAmoeJ9M9saSbkgoy4
         GOxG62jbnq2iLPwoV27Ml0gQuUp8Fg7GZttGZJEzbFioeKOHxjlTOr/5fAz8M78H/lLo
         i+BPjEW78+NEdLD8Joz5D/ojPDHzKBzjTjQdVVB0OAFmL7BKN4B1EACz6yJQToAgAwKY
         bswCa4t5dLG0WPAUyjo80SnzmRadZdh/QfCjNk5OqIqSFtUxqUqggPq5wbPLc9lkR+Rx
         Brpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795812219; x=1796417019;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZjBJFtH+WDTVNVp3EGI8H4RuqImBz2xbif9rr5XKFk=;
        b=hWPUiIhHu2ZZvf+UwoHCYk+7cv9GfrN6qNDtc182HUxTzaHPxSMEt+R3Yqsy9GfU5N
         VW6yMjAMPQGiQUvP3drTm1vQT1zX7b4kaE6x8Jhfuia3KBs7iOxG5Hy4zf8nLAVrlkpL
         UrrJSa4QZ4WC2Til6XpxPnMSjxMBCY5Y9f4pKLp4aMRcsRP62b+687yDBseKr+VUT45L
         kG9NfaKhLNvgj3N3gZ+0H/ah725PU/vHGlHsflsdvcJUxfb8eg6k0FxLrZmqH/Uh5k7Q
         gGzXw9JpL77TtQoVY8uWDnRI3SSZmlatNJeGK2MzFczZDNuG7oHrV2wPspuCQFY6Oo0c
         zfgg==
X-Forwarded-Encrypted: i=1; AL+hErGZmB5DStSHc05svOxDhkrucRMols6niTjNpMmtgxMeReZYD9vHvzq01oPokVNuBgIOTVLLCjQEE//grokN@vger.kernel.org
X-Gm-Message-State: APuU4Z84oQ3dp/0Fc679gEdq8psTqWgBQ2UOg6+g9/BZwrjZizafK5Kn
	iRMSERaQnY2P/TsknhetvJ10eWOuPTn+XdUC3e+dfGNv2vHsCSHo/xasqUiKO9IyCZkALdUKcMm
	cG7WhxXFaFu6gYKg0iwnFqpNGPu9Ekpvqtf314C09zXAPdNNHpOymJDH99uAgmJP6AlBT
X-Gm-Gg: AZFdTZdLHFqYmaStN0VnHmbKh7dhYjwNcpLV9LUBFD1KH8UpR1/XqL12+OHHYSf9Ey1
	rPqkgUnCfs/vDNZNaw4mf7N+WG3ktNmUyKCtFkkxfpSzdB9lQN7ksuhwzxgbusEFTWLuJoj+aUt
	A45IxsRGWVS4UQHn8YU3w1MFJPzYoYh2DdPWBX0ztYSA3QBJE+CKo1in8BfBXE+9mNuTDiMvrrI
	LDql8zcclRmGuhLzl9hpOJiB56I6VQnC3h+AzTGmNK68BvaD3KA1zfaanb0XW2ul1oBB8Uts9mf
	RubxwW1JmU6j/sYZ0Q5ZpobWzuJqzbCr1kdtFD+EdMAIa17FCu4OXGxWjHdfBooMHuifPpN1Qcy
	amrD+omouiJEuv69ey0rEoEMe3vdEUC55YY2PF0ubra/LetJTqQRD6wJ+awE8Hl93rUe6wMsc4g
	PPn+ZmmlOHbves1lhA48Z6/sawQlqPYNvhFFoZKz2iYWRNQGWHqyEiX07zQq2qVg==
X-Received: by 2002:a05:620a:a408:10b0:94a:889:5a41 with SMTP id af79cd13be357-94a08896148mr1304248685a.71.1795812219010;
        Fri, 27 Nov 2026 12:43:39 -0800 (PST)
X-Received: by 2002:a05:620a:a408:10b0:94a:889:5a41 with SMTP id af79cd13be357-94a08896148mr1304244785a.71.1795812218543;
        Fri, 27 Nov 2026 12:43:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd07b242sm6028363e87.79.2026.11.27.12.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:43:37 -0800 (PST)
Date: Fri, 27 Nov 2026 22:43:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/msm: fbdev: Unpin the framebuffer buffer object
 on destroy
Message-ID: <ds4nmo6fbvqiqsdneeyacbpbgxxoxftcfp5nv62ayfsxwwv5k6@fm2y65xlulht>
References: <20261126170535.361985-1-vz@kernel.org>
 <20261126170535.361985-2-vz@kernel.org>
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
In-Reply-To: <20261126170535.361985-2-vz@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MiBTYWx0ZWRfX4IK/6JE7fI2b
 mb3zWCHHPz1dFcfsMC5qv1AgWLMLDbBg+OddPPtnhHmcYblLFqYDJIoyAnPdAvbFmHpQL5L3hT4
 lsh37ZGYcURAwm9oxQ+NUiJSQiObnFg=
X-Proofpoint-GUID: nTM1cQb90macL7vfLz3poZ2sv0hZ-78A
X-Authority-Analysis: v=2.4 cv=LPLz05W9 c=1 sm=1 tr=0 ts=6b09eb7b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ze0TPCDu1uDqidZxEsoA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: nTM1cQb90macL7vfLz3poZ2sv0hZ-78A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MiBTYWx0ZWRfX5xTFi3MKVoDk
 qsZrThQM9DvrPZlTgQQ9McoJi8IA3nvAx2EfPDpOQiBfBYKIdtjqO+erwV7hPTxXuHmSKR1BjTg
 vLNQu8dBwHLHS6DWnD//wpz6SRljlzNYbNIn0pUqiGV7UiZHQOC0s1xcIN1YGvEUzkV91pl6S0z
 TkZu639Y6PUM8UTIe8Fdqv1vM2weZ5SB+SKRWsQ0r59v3DLKSCKW0Q15fUIPc6lBaHbpNxEnRCr
 T13Q9UqVzrITif2gXt8LPg989CCNYQCNhuGTwNy4ckL1gUzEbmzAt9UOU+nj+fVWYzzz4tn1+YK
 hGSPt+3LWOzHW0spgTLiJKXO5s3h2ms6ezSD3rMUR1gm69jisv8PhsLj37rJhqhUxzzIRMGsAB3
 QUTFRFCG1AKp+igew5zq9sA/VrNJiuUEsDszdTzQUT6lokoeSHXK4Jw6D5LMMt45FutLmRqeeH4
 zZyUFKBR94LrS02dONw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270082

On Thu, Nov 26, 2026 at 07:05:34PM +0200, Vladimir Zapolskiy wrote:
> The fbdev emulation pins the framebuffer buffer object in the KMS
> address space and maps it on probe, however on fbdev destruction only
> the mapping is released, and the buffer object is freed while still
> pinned. For instance on removal of a DSI panel driver module, which
> unbinds the MSM DRM driver, the next warning message is displayed:
> 
>   msm_obj->pin_count
>   WARNING: drivers/gpu/drm/msm/msm_gem.c:173 at update_lru_locked+0x90/0x98
>   Call trace:
>    update_lru_locked+0x90/0x98 (P)
>    put_pages+0x8c/0x104
>    msm_gem_free_object+0x1bc/0x244
>    drm_gem_object_free+0x1c/0x30
>    drm_client_buffer_delete+0xd4/0xf8
>    msm_fbdev_fb_destroy+0x54/0x6c
>    put_fb_info+0x48/0x84
>    unregister_framebuffer+0x88/0xf8
>    drm_fb_helper_unregister_info+0x14/0x20
>    drm_fbdev_client_unregister+0x18/0x34
>    drm_client_dev_unregister+0x80/0xfc
>    drm_dev_unregister+0x24/0x98
>    msm_drm_uninit.isra.0+0x8c/0xcc
> 
> Unpin the buffer object on fbdev destruction in the same way as it is
> done on the error path of the fbdev probe.
> 
> Fixes: 940b869c2f2f ("drm/msm: Implement fbdev emulation as in-kernel client")
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>  drivers/gpu/drm/msm/msm_fbdev.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
