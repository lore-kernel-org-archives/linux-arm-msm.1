Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795809514;
	b=dpFAbamFjxuz04mv7pt3VbJhwoLxIAScmPG8i+udPA6IJiOZZyQaieEfdTvZP1dX2cNo
	 mVf0/wg1d5192HlLbVY6zYdFBk8pW2voLdBQAmZ9UkAWb9eqvXJLyDOwXqsoB5gP25EQG
	 Lue33hvTkJgKf0OX/v6zxBnc6NCVaKhj3lqmbLU6BfvmzeQGYVq/OUL8queTM6uXETzDd
	 OF67P4yuDrdGmtL79iD4HEje7LFvu/K8l4xigdOdGnGEB7sDewedzsR/Jx08WrWdjVs/c
	 3yps+mrpOjPlIUIKnYlHpK8mfZaJMtLG/bqIQAP1zoxAczkdjWwzgnKMu11BQtr6SyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795809514;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+XTNWIgi9ID8EoeN/DwyL/tKJe5joumzVvmrChys3j4=;
	b=qkYpAIUJSbd5dH556jFTf2WdDuYBzu9ziuQVmwgWPqFXQWxknzFP2WHel/QDqEBiNwlQ
	 CNMa/H8LoDmZuFhjurD19xFK7hWRIPM3KTmalJe6BxmfJ9HfEN5C9KnnVHhprgK8+SOM+
	 ZMK+74QJxeG2Lb9ZzRU1emJJzrOY9YLubSYB/IWWTmwUVUDlidXMtQYCLjIePKHB0UM4U
	 XLM7brnJ9pVQ3FniHN31qD9nXFJYwceLXUE6W6RUaq0CSaqnNog/C+YUsQeThh6lDClu6
	 U2aY3YjI63Zi9nJJPAFhTjgOOR9l78aOzPGfphj9+KdBLTXBq1EU58FkQh6b+UFddJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g3FX8NKb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OsX3jgu6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37E1606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A37E1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g3FX8NKb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OsX3jgu6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJB2SF3134392
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+XTNWIgi9ID8EoeN/DwyL/tK
	Je5joumzVvmrChys3j4=; b=g3FX8NKb7bzFF9rqGgqaeJGhFiOFZPYid3kFU+dw
	H4wUAAiqNfq2dOJU4uEG35zZVPR/mjCoWWOLltGW8MYRPw1ewdCbr+fW0r+ktYT9
	R7bGvYPtkknaZ+X3X4TUds3mvDYcrh+BtQVvOYed45LCnUHK9GIcPR7EXthKW+pO
	uxc2GME/0mZ/7Fdh6tiD1/BJ0lmxSspyf0B6m4UzCz+SyiF4OO8teYoQcaGzcMMp
	F37MTtK/umQfmwA1mP7CWtb52gXC2rLRLIjk+gdBCN60h9/32UPAhICCW9zqN07F
	pAgk3wOA983UtygjFUiDJHDfKpwkHPWgbmjlz65gKdE2uw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gatsnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:58:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3969a2a7so1173068185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795809512; x=1796414312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+XTNWIgi9ID8EoeN/DwyL/tKJe5joumzVvmrChys3j4=;
        b=OsX3jgu6YYt5dJBvCs9pxRgp2DWcvrW6syOkodpEhu/97WRdeFoA0fZ0Y3Ei5lfpjE
         L+oefhX2rt6CBO9iqGNBIGvSF1ItoqU2NQIzznBiBFMnWbaz1AGQHgSr3dmWbdJSXkd9
         ppSA1/jW3qB8cHBjVXG+6/R7Lb/Ib+k1+Tj8iWhgfOj1wR7hDb1WzTM1z1Ib1wsZ+sLO
         bhp2vygwxYJvhHPLB5sNKJRyfEDWRouZdhBM7F+Ll8CJ1ksOXmyHVpZuR7zxyM7Ivr0O
         0m2R4R0HTl7fkP50gN3YZP7wWih47DyQ0+VckQn+qrECu9+kJP3JaVsdxB3z4WyVukZk
         g5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795809512; x=1796414312;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+XTNWIgi9ID8EoeN/DwyL/tKJe5joumzVvmrChys3j4=;
        b=gkZLFIGsIcxdTuUg5NL/Rn27KJzA6DnMKH5fnuL23lVh1Vmwo+IMqQxk2wWfGIoG+Y
         LREHp+zO8FFFDcx8XcQrcZhdU7gEKPXveynShA7WEljv0RccOAQgagpwD51f60ow/BBz
         K6ylH/8tUFdoQkCnISSdWZp+USsvYj+0laQdsnnb5RQUSZf86uQwQLmpbAMoMGZmSgiH
         WUo7aHdkZHCmX85bHJtosGYb6i8abw4lA9EkiA3AJeA7J4h0HWOt/l0ZtkqQu5VDtQnD
         g1HtgkFjq40ddB8oMtAHOMNJQ9uw2a96/T/WqghuBsMKYyD3ucjNenedRBWlFErI4tiq
         7wPA==
X-Forwarded-Encrypted: i=1; AL+hErHZhL9rtES4sXK4nkmo/T2i8Dd7jk6ZKMREvLgDk4Fg0tonfWj9+vs8BuPrmbb/DNIUE9W5v8yCn6F5Ug7u@vger.kernel.org
X-Gm-Message-State: APuU4Z/KttOPUCuPuxJWNRl0+x0vO3HpQ8PT0PutHHjJFXDRIhBp3XvF
	onKntBjdtPg5lqXvbi3W5Fcmu0QyTDDRY8fiOCEpIyyYgbKobuEh9WUyL14NzfPEpuad1ej96W5
	fcPHv3xe5e6krJw0TgIr93E6Aeu0q2U0sII89TG0UhOIEx8KdWE40WdVh/h7PtU3Pe8NH
X-Gm-Gg: AZFdTZdq3zVPsPbif+28Fky4oMPRx4FvNMiEo0EtJ08j9hrrdUKJS6++86kmnqGYD7K
	GzmyRiVHwl94yUjWyTjktSFtXVMgtWY/gHYQ4wVMExXRZyk3AHTi9a1mRoNwEHAksBYotPa/KUX
	BfrSuDc5TQWaHC5EE3yJ6sY1r1IXIPkKmBFzjpFbdroPNSsFD1UnbxXuiopOL4n7KwurdToA+au
	fUqiHi/L78LoLw/JugMvGobb0nit/ZOSkdc5iQZ9jfEW5BS2kNTShFdwwyAKnotJ56hHAQeG++D
	+hMD8nKKxApxq8H1mP3X1qgw21jyfizhcnRwI5kAtWwgKrHFlETVITZhAGxpZyYCBZbL0zlBTc4
	CV4g/B+bI8P3jUjsrd9AWOCRlYKghMP+FZmtZwi90VwadraVw3c5efl/LVDojNSrlPBTokTruYa
	vqshv5Jmt1YJLnqVnuSfH3tCRB1oq/tZRW5hImdV7gpQbKgtdMydtVHjYTUcwX5w==
X-Received: by 2002:a05:620a:8005:b0:949:3066:5569 with SMTP id af79cd13be357-949bab2f113mr4792665485a.46.1795809511950;
        Fri, 27 Nov 2026 11:58:31 -0800 (PST)
X-Received: by 2002:a05:620a:8005:b0:949:3066:5569 with SMTP id af79cd13be357-949bab2f113mr4792660685a.46.1795809511466;
        Fri, 27 Nov 2026 11:58:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd041813sm6192040e87.53.2026.11.27.11.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:58:30 -0800 (PST)
Date: Fri, 27 Nov 2026 21:58:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael McAllister <me@michaelmcallister.org>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: clear the DMA buffer pointer after freeing
 it
Message-ID: <o7iv6phsonvuruw7oufoj3d3glo6hpknpuwedue77wnprum2gz@ws2ux4bckblw>
References: <179422752570.88190.13452031230666113805.msm-dsi-pin-leak@michaelmcallister.org>
 <6m4cssgagnpvm2wawyj62veoqbglxv62rcqgxzaxvjynhn3dts@tlkaxvd6ph3n>
 <179458248277.51880.11276326781897812340.msm-dsi-double-free@michaelmcallister.org>
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
In-Reply-To: <179458248277.51880.11276326781897812340.msm-dsi-double-free@michaelmcallister.org>
X-Proofpoint-ORIG-GUID: WacZdyGx6zidT8gFhFAEugnxZrIpbwXA
X-Proofpoint-GUID: WacZdyGx6zidT8gFhFAEugnxZrIpbwXA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OSBTYWx0ZWRfX8HWV5pY/8PyM
 D3AWJQWmslNmfCDOU9VAy899eeXQyLzvUiP48v5nhU60Py+78BzxSLrYlk3n4+6DF207D/IcsrD
 4wOS94z2q0f4e3boD4FTYaeaB3cZLsBsH7qtvynVQKaLONEQVMWiWKEV17CceiVeGQdi0TlYDWI
 1LEQLhzfFoViHqCnnqrCK0mse+L8R0p0iEabngMjU+N/WxS/EBZMPNOMd+SgwBExv+7K128KO9t
 m5gND1twR5Da149pSwYK0ZxDDv0YBIw+25YyfvhLeVIrVbUSCE2sQyj0KVG45WD1Sa94pp8szk1
 HsggZHgD51Ai3l7cqK7PoSDVUq+WzlRxDE15FA7XN6Vr03tUjLl+zgYrq4jHdHyctzhoREuJY/e
 m06PSLuJOJl6QlXJUSWnF0Xdpi8KAhfHYmtBi9orAiKrF1cmR8iAlnTtpG6iAihVl3EwvLFFXiU
 0i8oo7NJU4CFW2upeyg==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b09e0e8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=JwJ85b4fAAAA:8 a=EUspDBNiAAAA:8 a=hKRTAnW6OJ533CQEYPgA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OSBTYWx0ZWRfX34fvImn+3Wx6
 43r+eM0vxqp/5wUDIWveG4fDHyyIncEQRlT5xL7b/b035ZwARVBbZ6LNgArAZ0lgt5uGFnibEih
 1lOIV9eVL2dlMVbZIr2RQaqnIJuWvjo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270079

On Fri, Nov 13, 2026 at 03:08:02PM +0000, Michael McAllister wrote:
> The DSI host survives component unbind. On DSI v2, freeing the command
> buffer leaves tx_buf pointing at freed memory. If a later bind fails
> before allocating a new buffer, another unbind can free it again.
> 
> Clear tx_buf after freeing it, as we already do for tx_gem_obj.
> 
> Fixes: 5e05be782645 ("drm/msm/dsi: free TX buffer in unbind")
> Cc: stable@vger.kernel.org
> Link: https://sashiko.dev/#/bug/linux-6f5085d3-ef49-482c-86e4-a2438bc1b91f
> Signed-off-by: Michael McAllister <me@michaelmcallister.org>
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
