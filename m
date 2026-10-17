Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F03395240
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 18:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792260998; cv=none; b=sVg0sFkrnlS6y3ycTPUU8mqo66v+qLJgyRbGcALFOMKnQ3fWY4SCSPW1T39SJHm/mZljc39iqA9AGRKdQZsz/hE8LldNMFjNkRcrfQlJuzCAfVeaVpJsWuwX0wyeVTvzwtduBM9ADnZAbxQKQYWMzs2qufv9/EiBVyDdNYtDjM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792260998; c=relaxed/simple;
	bh=xCzKvRe8KO7FvMJxTNAXsPzHcVjLSbgC1mvTnpImzs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxomAIzpFsu+X4Pm4PBuY3ovtprsNg4dTaGSYSdwogjRr90kprxkU0U2GgWHFLPaJCK4g3nQjFp4bYa31W5k6Lfsw2BhbVfvbpDUd0Mlxzw8MBAIvNJfAtJ9/Xjefy7C+bjjoG82jvuJhyIbLa9o+mWJXXiYlXttFrFCA3uckak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S/RfhN82; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MCO8eiL5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S/RfhN82";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MCO8eiL5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HG9oZf2598464
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 18:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0nRvE4iYzZZkY8FL+vx+dpAmS+CxJcSbG5OBNTwgPiI=; b=S/RfhN82Lm0VO1jb
	QR3BDj/jzII96FvgklOjhpcaYnIKzz+TZGjB/FrJ9Qg8CbqO1mJlf2+WF7+n9G7Z
	rsWIHqkWh5pClwfNbBBjroRiv9XgPMNBVuRQe31DY0q3W14P/t2IBvrPYTA+l3RH
	HJK4KPDZOkd8IOOPpYfr1iGp0WWW06e2Fo6aMPbMF84o6i/ARMvboWObdcvBEykP
	aCC36vwnN94fH97q6TOwsc7148v3IuMKwAeiRrNWBr+IGKSJ/+kj8GsDjXoFSeDS
	I9WBFqSwApaXhOlKWXLsX+zpjFhYTD/AZFuVsVaUoWPp0ABZpAMw3iqYVNHo69eu
	VJIQZA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxqfsu85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 18:16:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so2738775eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 11:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792260995; x=1792865795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0nRvE4iYzZZkY8FL+vx+dpAmS+CxJcSbG5OBNTwgPiI=;
        b=MCO8eiL5illGayw7NilYJQ7kHtZP5lbdNnM4plVqIM15DH0eZ69WI+inDVzF1+uzLu
         g3ehhCJYhL9PIJ/jqZzDEnw7SGI3bXYF5bU15KNrqbvRKJAAoGY/dNc5eRGOqaGDdMdR
         pXLBzTYUGtmtroGcivxvIiL8qLmzy/qYdeq0lSKEgxPJDMhxHIITbu9JlKe1g7vhFOGS
         GIcl4K8JsPM7Kd6Sl4aEbXGbjxggSFYTVitqfJ48BOcpkurwzfyKM19QL6AFj8uwUzIu
         lfh3+od2wiJJVnlFxrI4ErQ1rcxYVeOv2Q1yRzhbitf6pAmY0XJkPMKg7wCjyqD92H0y
         tWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792260995; x=1792865795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nRvE4iYzZZkY8FL+vx+dpAmS+CxJcSbG5OBNTwgPiI=;
        b=Bahn00+tJCVLeNeau1uXAadJ2IImka4I7Fya31CF0Ubvhjac8NFbsDSTGavXH0rMdJ
         OzuoWPkj8ubqkPTtIZ9KUx+rIJP/kdnI9IFW06BYSNJb5za4lHAbRtRkeuGdymH3AgAD
         OIpCq+8zQ3ltu6MiEO4Np3xZbk1WG9MY09M0PIm4HYlCQWZS5jgD7lXnDQ+4jxV+khBU
         /kBB4TAfju/8tpVqilf8kf5xy7xjdNKSLE5NKmg3kk6yu9BQ/zI/kngy0Fn93DQ56FbL
         ASQRNcEKdRk1fOBOZKWHJaeJJCssgaAHafY35htWxPd4+kc4ogv4ZyhQuBi3mLk8YSmU
         TQZw==
X-Forwarded-Encrypted: i=1; AKwUvBz0IHqgc/kEnTmkoNRJX0uqFjXeF8obfRgCg4VB9I7WRyxVBOrGsolBb4LuKd3cIZ2CD0xl8UvuZyGluFqb@vger.kernel.org
X-Gm-Message-State: AFq9FYKI/rBLF56UQM4hsjBim8yffsobgHPZGHthoC9Dr95+FTqL9QbK
	CeyRHcGZdSe/e5MkZuhdmzk1y52xB+egVmsL26fCtfdUzPbw49P/MHTjMyJdkAG+TUalS26tfb9
	fwHU+aHLulDPxl7auiNa3Va+C9Eve8FlxsrUrYWCYUi7tao3Rcf21vvQIp6FbhxJa43Z0
X-Gm-Gg: AYBFou2RoBKbZnhrAGC/0u0X1vDqvNI9rSwjMmuIq5VQTBPxcj0IZ0uoHZcyAPhS/px
	GcIoLKI2FVIJbUT5Ht+/n5dAVax3sANk//7xvQGP3ZInB3F0ebVFO2LfuWC1Sk4ApnfIBAD731P
	7gtHFBShyYzRNjHWGsFWwGXBg+lMyHFE994OfQ00OfuJqPOpPhWbHwFP3Z5S3gtuo/aDDFxRT2O
	NfZ7yx8D/IFe9KCOXXQL+s6gnI7Q2uX1A15D6watv0W/4GoYdZ6Cac76sonHUEXPFxRwNVelsC3
	k+VisOzBwN2IPfGQM3mtlOXl4inr4CqeTs6aC9m6/BDxq0eysQY0veQOp4WPu8H9oDyDfJKnbvl
	da/Hmxyb4wND2VWsC0JDkNpZaU/E=
X-Received: by 2002:a05:7300:ec8b:b0:341:4f3:8f84 with SMTP id 5a478bee46e88-361a14651b3mr4204000eec.13.1792260995168;
        Sat, 17 Oct 2026 11:16:35 -0700 (PDT)
X-Received: by 2002:a05:7300:ec8b:b0:341:4f3:8f84 with SMTP id 5a478bee46e88-361a14651b3mr4203954eec.13.1792260994417;
        Sat, 17 Oct 2026 11:16:34 -0700 (PDT)
Received: from [192.168.1.8] ([122.177.246.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cc23sm21263364eec.2.2026.10.17.11.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 11:16:33 -0700 (PDT)
Message-ID: <54ae7a34-2ec9-4051-ba16-136a0228609c@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 23:46:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dsi: fix AHB clock staying enabled across suspend
To: Joonhoe Kim <26rote@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mahadevan.p@oss.qualcomm.com, rajeevny@qti.qualcomm.com
References: <20261006-dsi-ahb-clk-suspend-fix-v1-1-67da848e1b0a@oss.qualcomm.com>
 <20261016125036.1069-1-26rote@gmail.com>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <20261016125036.1069-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA3MiBTYWx0ZWRfX4nbOo9G6eAwi
 fh4Y322xB4me08QaF3fRwFPiLmmwkyEiwUYVBbEhuD6kQfuW5Ws2EB88KzDatz0yzpefaS15PLD
 0VbwFuYkWLfl+Ur9+8HkprWD7emqsY4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA3MiBTYWx0ZWRfX8N/fpfcY2Eti
 EL2ys4RUNANMMRR+nbBid9IoC8PGsKNgE2GEkUpySebNc46U7qYH0Q/kgCsVz2SJZCyMP9DTdR4
 hU2P3kylfJnWE51Nc9YeA7QxmMSwOe8t53WAnO19glO+YgmzWOLJTM2uiE56NIDGoyt/ydAkl9f
 OmKb1o8cf4XD7iHjr96vK5gHWqrjmpCgQoYkmyYmzZ+GMWq47VBrqNx39kYpQQZoJR9iYZqbjp1
 db6fpFlqejuaCJd/ibPoxnhdgWVMnBigH73BDBByWRMC8GPZhvomG17z72VPFVWZio3d6RQnGF5
 IEG4qVKG5xPJ9dUDxI+VrOCAW5XSp3D1s5IHQC8sHWW7ZaGTlsWySqFJJUPMAJmLYbJpTsrf74/
 J+ETJ6HEDmwGqiH/jFMxDKthOasGXx5BoRKL5XV1mMVAndi8Jn23bvkPzKh8hUk1OdN8v9ZBnaz
 KItekCzqRZkSaJd7V8Q==
X-Proofpoint-ORIG-GUID: awTXJUKd6dpHWWUuU7LxRBzNKurwObcg
X-Proofpoint-GUID: awTXJUKd6dpHWWUuU7LxRBzNKurwObcg
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ad3bb84 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Gy7JURgNfp+0T9DH7I4t3Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=5upmOk6ioxsuaylLKAIA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170072


(Resending with the lists on Cc; I earlier replied only to Kim.)

On 10/16/2026 6:20 PM, Joonhoe Kim wrote:
> (Resending with the lists on Cc; my earlier reply only went to Arpit.)
> 
> On Tue, Oct 06, 2026 at 06:43:53PM +0530, Arpit Saini wrote:
>> pm_clk_suspend()/resume() only call clk_disable()/clk_enable() for the
>> AHB ("iface") clock, never clk_unprepare(), so prepare_count never
>> reaches 0. The clock (and its source) stays reported as enabled
>> through s2idle suspend even though the display stack is fully
>> suspended:
> 
> I looked at this on a Lenovo Legion Tab Y700 Gen 5 (SM8850, bonded DSI,
> v7.3-rc4), comparing the current code, this patch's approach, and
> preparing the clock only in the PHY runtime callbacks.
> 
> In s2idle with the display on I see no difference: in all three cases
> both PHYs are already runtime suspended at system suspend,
> disp_cc_mdss_ahb_clk has enable_count 0, and CX collapse during a 100 s
> s2idle is the same. Is the clock really enabled during suspend on your
> board, or only prepared? Reading clk_summary runtime-resumes the clock
> controllers, so it can show a different state.
> 

Hi Kim,

Thanks for your observation,

The failure is that :

[   55.005539]  disp_cc_mdss_ahb_clk [19200000] (enable=0 prepare=1) ->

enable count is indeed zero, but the prepare is still non-zero.

The enable_count is correctly reduced to zero by pm_clk_suspend().

However, pm_clk_suspend() only calls clk_disable() and does not call clk_unprepare(). 

Therefore, the preparation reference acquired by pm_clk_add() remains held during s2idle.

> The difference here is with the display off and the system awake: with
> the clock prepared from probe (current code and this patch), dispcc
> stays runtime active and MMCX stays on. Preparing it in the runtime
> callbacks lets both go off. I have not measured the power difference.
> 
> That variant survived 30 DPMS off/on cycles with clk_summary read in a
> loop. Did you hit the prepare_lock deadlock, or is it from code
> reading?
> 

The reason for avoiding clk_prepare()/clk_unprepare() in the PHY
runtime callbacks is that the PHY is also a clock provider, so its
runtime resume could potentially be invoked while CCF holds
prepare_lock.

Agreed the CCF prepare_lock deadlock is currently a theoretical
concern. I have not reproduced it.

Thanks,
Arpit
