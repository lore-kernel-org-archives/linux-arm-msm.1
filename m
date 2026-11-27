Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810899;
	b=s/Idp1SetWxfO7ZTxZ1YOrC4KyB0ieh/qgNoGDNhM3238W58L1jk/1p2gPYxK8+9bhUV
	 1bJfjUm/Qh4+Q+qiN16pkiPEg4U6lRU+Tj7KgZmtCRHcjN0o/D7siexVDlmAINJgZiglX
	 k1HCyvTcQUx1tO/it82dUpwJAGFkat2iBPdbbE/azueL1HoYIN2MmmcTyK18dCvWvIdjp
	 2LrRu7mkbWCsbF1C5nNOOkRldhC+46oBfSd9UEZ5bB1UkfwS+dYAmi6RvwUSlH2R/HXkN
	 z3vYMYWL/oUc+T2sRyPN/TTMI4taYOLEzmSD1Y+cPYe1le2+83KzX0PtgDj/trtH8/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810899;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FTlq7GHXu5G3li22pVfzinksVn7ret/unNe16lYihL8=;
	b=RhNE57oU2pgeQ03oD60ZVBn3pyf75cq+RkUNPAkdtRz8nXnlnCrQrOv3/jEngE3j9jPB
	 JWhsoEF/wnYE6V4pXNRFO9Ppp3yNyXyY2Deoe/VYgJHLT6HmEsjhbVjN7Pi6AYwVk3Ph+
	 hAWcKvKhLPkkaatcsvqR1PWKjwJjkkRpUP/C2x2wqG39Cb/hbjoSd/rMLdFxtZRjRByr3
	 I/yISeyW69hi/UqY20+Q3xvdvA4Zv68CCVBvyD02TltbnbSXzwJm+VsznWpcymcVe8BVj
	 yIXn/kjYixiFKCS/LsycDe0oWM8v3wDmV5HcwzzNmzrtSwoqCnnDuebnaE+524fELQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J1JeHqHW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PixfyeMZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C20606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3C20606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J1JeHqHW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PixfyeMZ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJRnkK1381776
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FTlq7GHXu5G3li22pVfzinks
	Vn7ret/unNe16lYihL8=; b=J1JeHqHWBSTXS+pQ6GMIXgEGMf+5zeOjvjEzJIRR
	lkH6M5YruAkk53g+9BVQ4Y5WCV/qyxuOCGXdoc/ukd68CJ8IMEUgMZpGHhqO68Ll
	ZgBS9h3TP9wfIaO2UO03HMsXwu934LJ8CrcouNw2UB1mJBecG2QcnzCG2OVM0uuy
	hCaGFd/wlvZtP4+tpsYg3BPLdaxFPj0pHGxyeIAPxDPvEuo0t0N2yywGWqRZXoKk
	Xm6bQxUZ7sTIBlJIgz0XC+zuBxhAzGxqSdynMr17IUMeY3YWfBP1qhj4pqzMAGOi
	eivYbttTNwRevEX8GnXnw0II2HF4Dnmd1VkJYT1iIizIcg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g1s83nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:21:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495a1f5e47so1253100185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795810897; x=1796415697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FTlq7GHXu5G3li22pVfzinksVn7ret/unNe16lYihL8=;
        b=PixfyeMZ8uY+FkwN9pd15ZU8EH06aKg2GRwMC9Cx+eSfUFp659LeQSmrQTrl9ySxwL
         TbnjEmp3jxzmMstx5gnf0JxjxPxBsfKGVZlku/A+wCs0wKta82JtpqqAFXGeKG1bWsZH
         guk4GjfYetBNxBTguoG6JGkAmk8WPf1vrIPmuqLkfNE2QFvV1C7KhX4AFQAgno+Fhr+y
         UZN8a7alUESJhXKz7L/YSs7ga6LM2j0TCzIdCe4HmWTCikJvRGgohqjNIgJK2LfF1E3k
         iHgMsAKrVq0B4go/rFFpBH6VIq0ZqiIqanb5w3xGdWsbsBxzMH8XvuCqq+T9h1pNtPC5
         I/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810897; x=1796415697;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTlq7GHXu5G3li22pVfzinksVn7ret/unNe16lYihL8=;
        b=K4ePNSDHa07eDVpUdvEjCrrMsicucvYwWlQ3CroFOU7LGZHpBYcPn6sK9irdL9ZoyI
         BtOZLTuXOTKX0XrxbOzEJuMzjF0YQBUvaj/8sxT4kWj4VjqijuJaOOhhCrvlh5fqWdXt
         OagiHRx+MFp3GU/tDCSgI1sEwZXdoe8ia8yqwSK+RI/zhUkvseAp4N/QI1J2YqTcWCaT
         3LrBAj+xWbH/siSLzl0ECrJzJD8N52YsZzS2YuZvY1f19gkfrMF5FpCHqgVTXV+qGoE6
         gT8KhLIjmNmkBRT0ALeVSZENFRmefWQSZ9fDt60hdYCYwtX18c7SRaUjsrQJnMBT808s
         rRxw==
X-Forwarded-Encrypted: i=1; AL+hErF+wfsRXh9Vm0XsKp47W2M2lhaxMV7uBqfFuLJp7aw6l8y2O5AcrRirKBfbS/nUND+LieC/12xdX8yWeBjf@vger.kernel.org
X-Gm-Message-State: APuU4Z9zRKeqn9cSrSrBPTfDoXeH+E+/ubThXNPOCy9FJrGQbXPWKjHu
	kUClyxOkM1A5Szn/PhLMlzD4hpossnKj+a9iOTU1wWrtj3BPs5F70Rz4CeYTSHQDuc0rR43fzmN
	oCvT0/kwYIqit0Kke+m6RtgP5L3MWGhswo9gx5xuIWbpMuHPMB80cOKc4+ApehfREqsY8
X-Gm-Gg: AZFdTZchtudUpLRqGA/J2AwPyG6mYJ3X5H76/7mLitZh5Fhnphk4FekCPsDIhcY0hbI
	4X1gihmOayjo3WVBERUkRoRXvzargMeD/PffjnwxNyweft8flOsd66d4IHrM21Bsk+D9gM3iB+z
	stRFQvaFSO/kzXe90+LjzZgYUGh1NmlFbywJbO/lw/aSPSH5MrIpEo8JDwa0S2Uw1gbxDFPTR3N
	PJgMd8G9BGE0KMwzFdQorB4MsM+CmhX0PdAmtLgcUU2QjYzQzxUdqRQhZJnMfOgyXdr0E+zWdYx
	/6y1E+9wmOXgGCA3/SypiQONa2lwWNK1+l8vDIFXTcUAEP9AawCOFIWIeV5Q3vbMGMBvHGaME3I
	rqBrzCzCu+QGB3xPHW3MRSznXZZQZpQj3sFrRT6BB8EjsgBgYx8fR/uCkdJdzYfXJxn4aFocSh6
	HzocoE/MZJGQX2e+0cSPsYMIxGvjPDZ8YhZt1+748sYywN+3O/2NEPqWk+KY01GA==
X-Received: by 2002:a05:620a:4454:b0:93f:18ba:bf78 with SMTP id af79cd13be357-949bab1bf42mr4865027685a.69.1795810896725;
        Fri, 27 Nov 2026 12:21:36 -0800 (PST)
X-Received: by 2002:a05:620a:4454:b0:93f:18ba:bf78 with SMTP id af79cd13be357-949bab1bf42mr4865021785a.69.1795810896262;
        Fri, 27 Nov 2026 12:21:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae80572914sm61011211fa.39.2026.11.27.12.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:21:35 -0800 (PST)
Date: Fri, 27 Nov 2026 22:21:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jesse Casco <jesse.casco@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jim Martin <jimmartin@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/msm/dp: stop the rate-set fallback at the lowest
 table entry
Message-ID: <2ks7dqx56coix2wshyo5qin66c6xhzx6bj7kip3sqnx634k7sp@a643crz3ajki>
References: <20261120192050.73315-1-jesse.casco@gmail.com>
 <20261120192050.73315-3-jesse.casco@gmail.com>
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
In-Reply-To: <20261120192050.73315-3-jesse.casco@gmail.com>
X-Authority-Analysis: v=2.4 cv=FYOiV5+6 c=1 sm=1 tr=0 ts=6b09e651 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=eFTfMnBmEVDiW-N_mhIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 3v2ERIy_iYwvDQQ59n182cvSfC-Iir3y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfXwwsOcAsfcmQF
 5oCgmXxN9HWzgfSs7zrBxaIcGJ2GgSfAxhM0hB5AQbIQQDypHgfuOaY4PymLpW12hxo/riaj3mu
 tI1yFSEfjphr/I+hF6r5tjc3Fu12228cIf01t3gUVtM3Sy40Jvpp/0T0TVYVWMB9aLzQiGkABED
 hPAk42xBa5o+YAmn0/QJ3k99ZyU+T6Yi1YHIDRncQDsga0fYryHum0A7blyed0tYP4zkxY7Ii+7
 YsEIY8UrjxNWh5vde3GYLqvAhbV+bfaFYfD0SXy4HrdS0nx7+DChDeegB9LR7U6z6MTumA0QuI5
 HdGnUMWxS1yJwM1/e4VbWcuwgkAB/FtQ6jOIGYSO8GM0B/TcCBCrNTYPLkOWBxXoEbZNBrnBNCA
 2kFEODRtkY7clGYAZxxIY1i2N6y6FP7Umu6whBWs7klkHxaMrbmDUQAN0kNigt0IdcFUwTe18A1
 QaSWl1BZpozVdATo+/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX125AwV6N/5cX
 SC0u3RKtrHWVFS/ltZqeZQzoa8dXBFMXt6obvCalC57K5E3iaGQubMtRDpyYcJi8bi6+mvi4aA5
 g/pWmtw5AVnEr7UjZfYQQ8eCVAjRgF0=
X-Proofpoint-ORIG-GUID: 3v2ERIy_iYwvDQQ59n182cvSfC-Iir3y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270081

On Fri, Nov 20, 2026 at 02:20:50PM -0500, Jesse Casco wrote:
> When the sink is driven through LINK_RATE_SET and rate_set has reached
> index 0, msm_dp_ctrl_link_rate_down_shift() falls through to the legacy
> switch. If the lowest entry of the sink's SUPPORTED_LINK_RATES table is
> one of the standard rates above RBR, the source drops to the next
> standard rate while LINK_RATE_SET still selects index 0, so source and
> sink train at different rates.
> 
> There is nothing lower to try once the table is exhausted, so fail the
> down-shift instead.
> 
> Fixes: ed100aa239be ("drm/msm/dp: Enable support for eDP v1.4+ link rates table")
> Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
