Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9554BD780
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551906; cv=none; b=ra6ca7N/yzJ5dCM5J1iX2vsG8zAPvOEP+q7FinrhHagNtC0A9Qr4FmkzcblQ9KQOECycz7wtP2XGpVDn+71jfWPfBmajpPFwAVXTOpArZt/BlrXzzdTGJZsqEDNq1mAPYVQ69rwQVi2YxjAczu9Uehr04T4WktZPQUjsyXd1OLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551906; c=relaxed/simple;
	bh=35owgoMuwrrGhU1IN3tED+EYAqd8IALpPDCTSNeIVXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RaBHTUEBPZxRnB2dfBEivoWhFsJq5EpYfOsjyBNvWzzdIe7UmFji8H59BVQINOAouc4YV3nBZ1C6FCYglxqYzuJEYwixq1vpgfXJuldBM1ghxWUYLzLAonU747R5oWf5aAJEwggm3YJBWo56ll3oIjlwLD0yPLlyKsp4yPHePxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZ6qkEpN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LabpTZho; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZ6qkEpN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LabpTZho"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KNsw1223216
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 13:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qYYBr2BmdY4zOcF4U3A9MMVD
	JkUDAoza8jdCzVd87J8=; b=gZ6qkEpN/3z0dp4iU/6TBh+4OpMelin21NOP/SRx
	MNxj7f9rZy6MhtORC7OPNIKpz0JZHg1I9i3mtUqbFcWTJLHI7Ojsva5tvjyY5YYe
	Lb673H5g63L1jckeq5bpK4hyA+XyP7tRAflWpb/Y71vJBHMrIc7SMehyyJEvBLZs
	Bpe6xluCmmAjxK7RFkfekuRVqoY1UDIk/2xSvobcp5PCmJ7jC8XP8VmxbWpeNcAX
	e3SSyS/PTEE49G1VR/8XR/5vL+X+sx7n8Uz6ekGflQa94kdQ005deNVvhvkg5/Jn
	ZOrVGikNdxHVoM4cJnL8E925DFF8Y9Fx5bbR+Jw66l+0QA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxkbp1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 13:18:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso1309032485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 06:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791551902; x=1792156702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qYYBr2BmdY4zOcF4U3A9MMVDJkUDAoza8jdCzVd87J8=;
        b=LabpTZhoIoMEjsMLcxGlMQ9d0VSJRd34LHbzVo64uUavhPpEBAcvfOcZPM2o48P0G+
         RqbU/Z4z4999j6Z5DpTv5vs8iLO425chbW4xPGn0VxUc8aeFVNHEcTnKBkdK9lMFffm+
         qV2FQWVOaSo4m1Ho2GOK6UyE1m9v6EgQRmgWLx+a4p6hHf6fQANlKesOoCzG/Opc9I0G
         m/COS17MgQ8cC45JA9ydbn90k6UBUv7zUb0pnpUiu5SwpWtbHvrvFarJI/Y9BSXIcVEa
         KOky8b+IZfKYy5dZ/L9U9d+hu3aanePPtQPNuZRLWgMzERMUX94th8y6U+UXOzblry6O
         pLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551902; x=1792156702;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYYBr2BmdY4zOcF4U3A9MMVDJkUDAoza8jdCzVd87J8=;
        b=j4cGDAEul4tOCB83BE5QHaDcJETEAeDaDIcI+8RJXQKZW9esvspUTc0w5MR7tHA00I
         6WdmcMzKv/9mx0hwr17YmcxspfitgEYOxFDVpASw2wB0bA3lTQbQP/U2K9DWKmfNjZ6/
         jqAI0gMxovq0AetqEWbyZ5179gYsf350+2JbXEv+JEQSfCto+osc5JC6RTsOaL2lnCVb
         B+RhW5deX/PWmPp7ezjs/zIBYUCu8AY4oVaC9If9jTbPRZrmk1Vf7AHjZ1O7TR0BCxE/
         JLsa7X4aoSHisCTcmT5e1PSX9fDCC6KFYol0YHxW404b3s9/dqXCST0PYfJF3L7uDnW5
         AypA==
X-Forwarded-Encrypted: i=1; AKwUvBymlpEzQbeJq9bQwmR8mSsiP1O+3jJSxpN3lE3uOAOq59feltzpQVSCFLMyQP6BqSEAHBJ9/f5+ga6XhM68@vger.kernel.org
X-Gm-Message-State: AFq9FYJCB04zMmN3mt7oB9VfxzXrljVSiBwM4i0Ag+QRW39SOyuFFaSO
	dtQDjgEMpdJSUvGgFF3PG8CO83DRzkvGVSP3u9F1mmBwy9VTiUkvikE1qrs+PPP5l2DlIBJpx23
	ZRniF9nxJ/unA+vARQeGoJGwj5JRnAxJKaGS2gM3yZT8XPGBilu1IAlZNrj/S4qsWPcGJ8CWztx
	nmTsY=
X-Gm-Gg: AYBFou19amu4AdvqHuFVQI+6D9yJ57AV2lPav8DEPMSiTA30IUGFYvUsw1Ael3fEKmL
	wZS7zUU9lhkFQUZdQHxnVZFToqW5ApWqNtOtnfr20OwkRjdoKqME87tMDabMYVDX+AEjazPyGgk
	ic78vChIeh0K5ro0ofs5508OEuJ5mGN/fKqdFeyhA8+fbqtytiO5t0c0zLepQjjqbA5vMpd8JR0
	/bRaTR+wNVj3rg9g+PhFOKiF+1kOjtvq4JGiRq5GehfQ9lZ8NOr5xPCW+eBbAfwaXGVNJ1VqQrv
	PjRCCHzxPAJSAfTy9VTn9/8+NhEaTBgX+7ubEFfgFwrTniac/UCMVQTrzzBSRYOuc30gHH+VSXM
	IInDtFhd6vruJYGiYo2ekdZq8ZlhDqYa8Q3up2W7eydxdTpbVEE4mcUyNFhE+uU1ctl7fUvCQtm
	QsMWP1tkHOuaR4
X-Received: by 2002:a05:620a:2951:b0:93e:6da8:6cde with SMTP id af79cd13be357-93ebd207afcmr247613485a.35.1791551902181;
        Fri, 09 Oct 2026 06:18:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2951:b0:93e:6da8:6cde with SMTP id af79cd13be357-93ebd207afcmr247608285a.35.1791551901630;
        Fri, 09 Oct 2026 06:18:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cd5d8fsm5986561fa.30.2026.10.09.06.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:18:20 -0700 (PDT)
Date: Fri, 9 Oct 2026 16:18:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/4] drm/panel: Add driver for Novatek NT37705 panel
Message-ID: <xwaxsqtffljmv2tgobybq2f5v23hs26wy5zjdti3dziu62kq6z@qpzlpnmplnwp>
References: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
 <20261009-fp6-panel-v4-2-7c3819664778@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-fp6-panel-v4-2-7c3819664778@fairphone.com>
X-Proofpoint-GUID: CRm0JL0qJZuV3VlDFjERr2DnwY33w7Oj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX3x1/eauMM6sP
 vKq0/Jyibb6hAccbGejJZuBpiojL3LSqgnGfD0aITqLgUW0Q0AfRP9O/zHRBrf80FwR+ajWo09p
 NLp8eoIBcaL0gn04c1++CgEj/5I+E88=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac8e99e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=qNtwOHy-hT8K20Jd0IMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX5XEoLUnGq3lc
 U15ckPp69e+QBNn8DRzgzIAy4mrrBlgp9od00BDZgq/TIrfIfFmZ19XIrcwceNHnohT5FdZAsOr
 1ipCSlMbOIBFXmxVRt+V/p0wjCqLtzOQRtrTRNJsqGtJRiEmXUwlxdiryfRDGJmCYnhE6/i+Mls
 JgUMdGYHnnaCSCPnCpwMvUrBpAV2cgXmGN8HUbvn4CmZpA1pGcjYmNkN5RkavqD/NbITP0bd8By
 rT0o2zk20iWCULG9G/xEA5I7XHosbUwmyJxAUzDcUdwtFJpzrJIkGxPDE2USeAMzkZs/nNkqpOK
 n62cbu6j2ItgkI8SIQ7ZH80ojmYwC1o/qEvqwK8F/Jq4Yx1Rz9AAUlFWpvGUMv/fp8wppQk8KMm
 Au1LhITeCHyrh6KU9OW/BTqJ71G4AjNWmjpIjlSar3QbpwRu1L/HnybOZ7B3BUxr4pBocus5SjG
 iUjEFZZnWUhX+MNSL6g==
X-Proofpoint-ORIG-GUID: CRm0JL0qJZuV3VlDFjERr2DnwY33w7Oj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090052

On Fri, Oct 09, 2026 at 01:25:01PM +0200, Luca Weiss wrote:
> Add support for the 2484x1116 AMOLED panel from BOE (BJ631JHM-T71-D900)
> bundled with a NT37705 driver IC, as found on the Fairphone (Gen. 6)
> smartphone.
> 
> The panel can also be configured in 10-bit (RGB101010) mode, however
> currently it's configured in 8-bit (RGB888) since there's some issues in
> the Qualcomm DPU driver when driving this panel in 10-bit.

I hoped that fixed all of them...

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |  12 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-novatek-nt37705.c | 396 ++++++++++++++++++++++++++
>  3 files changed, 409 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I went through Sashiko comments, I don't think that this driver diverges
from any other panel driver.

-- 
With best wishes
Dmitry
