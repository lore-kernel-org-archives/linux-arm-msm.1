Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001D343FD0D
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672931; cv=none; b=mLMpfsNzvfW57NPe99Wz6U1SKBDAlEkLKX7SMJNmowyOcArZQApwJqqANBbYMNGNg7I5p3HlMqnTkOW0X4xPxfKLoh6YYOeqUrs3hhTGfrdcByhm3bxZ9rmk5uRiFg3dhrvneTLDZFc34bCmwducgJc766AGuBs+L8Ecn3Qy22M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672931; c=relaxed/simple;
	bh=p+noUzSTcDP2TBNM2+6brzgxJwoYDmWYz60fcBEo7e0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cE73r+2QY4O9lyXhOhRZyh421QbzoCtJkjovgZNsWxRj3mIxiQYRWYPCE4uO5A3saLNuvgmS4UydIBeKW7cA28sckRdPsDYD9Mru5jjiBExqPa9fnsi7TGyHR45Ginr+MTIC4m3ZRI7OyxbWO5ThJCuXlAw7coIBr2UNksSZT0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6UXBxZa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FAag37rl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6UXBxZa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FAag37rl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKldMM2830519
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wStl689vKyoFq/6cEg/+AB4y
	8xpvkblIjMb1tKUimP0=; b=O6UXBxZamSsdo4lgOvEDIVsSLTN7S9obxr/Fmdm+
	lXjbshbCu3REfZWd7GmhQvRB/VYm6e9/dwP1q1OlU6N9Ks4OJ+TNwMuYYq4u9G1p
	b9T+mLzu+QkZZMg9PE1sDhyoANsx41nQn13SnKSYyUFZzhedHsiQxfXjJ8jpgVtg
	QBohenJZlZfFd6d5tyofqSPLg55X2kXvutW5XWLq4exH/Snrn+ETEp2qd6lb2t1e
	mp1URPOZC5EztYop8dMvNLX3ywnBsZhkYszYjlDhqODi7RyFvoPcW/9S1PF4qD5C
	C5G5PK6tm0az0srnaGQRMBl21eQnrAn0OFgEw5vYalm3zQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6a93fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:28:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1e6f602cso183148331cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784672928; x=1785277728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wStl689vKyoFq/6cEg/+AB4y8xpvkblIjMb1tKUimP0=;
        b=FAag37rl7gpeF9Jb4QVmwgG2c488AuqwHeWo6NgoaUySvXn4cmlkdG7Q4uXA/Okc9Z
         +vEg/kOQhn28ubltoY5GkpwADWasarOuh5UQMd5iFWkYRZrg6q/ZKKGrgqqOV/XkBUJ6
         uvDLm5WgsaZmlMubdXgBoo2E6mn3a5n6Q/RcfTTxFiVjWLDsQmwAwwM/LJ1RJT1tVvdw
         yUgAUW8QCnkOS3ZMRcnLD8HkUWwOcB2+craxpnbJORdelqqIu9Y1WwX/iftuSfJiFPp5
         Y3OVnFgfCJJU3YD3LwMcUMshJUd9Y0qpKO4uk5mEWaHWaQKiBSnohxhJGi9Pj0gFfBO7
         3JMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672928; x=1785277728;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wStl689vKyoFq/6cEg/+AB4y8xpvkblIjMb1tKUimP0=;
        b=na3X7f2DJ8+PHnK+HtvFUuIIb3Z8XwhW3G0QzupwqZ3xyx9RnI03FFgaq6pcIyJp+7
         sD0fID6LSNfhJML2kUgv+MxyhbInUv01bA8hW9ScF6oD56a0cxY9Xz/Hqkvz0dPB1kci
         d6D+qh42J5jtWEUEkN/vCYpJoJK57XwA0Y+5waYgnohETeM7V0xF80UnPHQKw+bevFZR
         craGuibcYcSv7YuJn7xn88JlnrEm5BbD5VmUKTeFLzyreWN8I/z8DTYO1lyVFaDK8WcI
         AmYQdtBs9iMuEI6zoOjBl2sFh0KTL8Gnt/VuSwL0Eoy8+QO1x3UF1i4Vs5/dVJM+i94t
         zvSQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqAfNRS4BhdmKWizMTd9Dk27OvPaZAyiaEBKzzY3+2vveySodbR15ZFwT4CQ3EpaEyyR2lq3yQx0ych8iK@vger.kernel.org
X-Gm-Message-State: AOJu0YzGPS04x/GJ1d+s4QRBcRg2B9LRWuHP9UnAHlQJLn0/QevBkMIu
	jwtryx8crd0adn+vwQQ2plMmoPEvCsxylgFg+nHaX8YVLFIHhIpuoTL4r7Y9O9AfUw5Sxvf9IoL
	mVqSd4tu7KLlNMo/7NnHy2ihUljk50EkOEq0YhDYZyMavsgNopOjodMxSirUeHbTND0KY
X-Gm-Gg: AfdE7clTmNlUP8L432+JeNO/zarCS16e/dUJSVr/Gu+hIp5l/AsqT2Ff7s0WyZwDOEs
	KpkOGdEDUuN5QSfnZwwu5MOrVnMYVHw8nekK9cO5HN8Y8eVquibyyArGLpicWQ59u9jawS5mBrw
	GahQZvU6F5l3qsFjEGjs0gI0XvPvBG3RoPOMSYEOhtCUTeyhl1WOp3/RB5II5W0kJnXBzxs1Jgq
	16laPrt1LITvA2NezJBpcUcrmOWX0xG6FHwZ6ZoiNcrlL5bMtRUUky7sGMPH6i/f0ppIrsA69Jw
	iYIF7XOnAXgXoEObER1lJ4gShWj95clz1USmU5zjUZjJy+9G9+J1mWTS6pTrjYtzTxUFGyUKciR
	rq6Dqf5TVekJMqQsx63R6l93R1o1QVIS5Lnexa2QhpV9PKdE4F7Jvbi8ReLOMnkcrg3X3oN67JE
	rsbt+u87xiNylDHw==
X-Received: by 2002:ac8:590a:0:b0:51c:1fa1:80da with SMTP id d75a77b69052e-5213f66b3b3mr187762761cf.40.1784672928106;
        Tue, 21 Jul 2026 15:28:48 -0700 (PDT)
X-Received: by 2002:ac8:590a:0:b0:51c:1fa1:80da with SMTP id d75a77b69052e-5213f66b3b3mr187762481cf.40.1784672927711;
        Tue, 21 Jul 2026 15:28:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c088sm143851e87.16.2026.07.21.15.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:28:46 -0700 (PDT)
Date: Wed, 22 Jul 2026 01:28:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP
 remoteproc
Message-ID: <q44bgzpfvmdyf2nruejrdy3vkrw2wl2boli5owi3gsgrmm7zjb@ekpjkix6lbnf>
References: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
 <20260721-dts-qcom-eliza-add-cdsp-v2-2-e1e52bfb3c12@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-dts-qcom-eliza-add-cdsp-v2-2-e1e52bfb3c12@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIzMiBTYWx0ZWRfX6LCKSS3CcEXk
 pD5UpZjtinkEMlcelvsE20/F3Imc6aE1IcWmiqn88riWFh3ADB9VxeW2WXYmscwmPbS4o/ofBVp
 iECJj996u6T+h0aQMMe1tUc2TDFvdKcQFEYApgf8d6wqawYatcdRG/8Rlt2y6U1hyDTFwZkh+Bl
 U8OplpNc7Ap9hwjy3Gow3HNpeXTtuZrRl5I0Ltea6gv1Xp6jT7TjMh6Qia5qeu8XIQE0HMM5NwL
 f0bYXIy/4S9XTO+V1OysY/SQ6DlaciK58/JWHzYYw/yn6vWhbYwuRciVOs0Hu0HhcZzAfxM8R5X
 6odjdg3VRjXaXim/mBI5HoXqFm+SsIvUYGwU4ymB+d6u4fs/aTy9DZpxNJMq4YotCe6wBlHbKH0
 awadnoYJkBr1Dtk34AVIaHYn4w7g/p4Kxn9nJ7SHtA0Usdu+B7mt41OS5xz/SXnfRamDctGDcfA
 UgVHJn0EBM9oZSyLMyg==
X-Proofpoint-GUID: 6YU2hiXGZn5Dmg1l2oWMw059Dy0HCJ6e
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIzMiBTYWx0ZWRfX1C4y7jAcc1PR
 ZMFUKYrEEd3IaZVaysQ3Yx+sFw72pH92660krOofmHi+eyRddT2jjXkTv5kw48CKphGsrcWktQ6
 FS3Ilpuyu20U0eD2IYIlcTpqgbiiGVw=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a5ff2a0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=tD95H0FGCAwS4eKOgloA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 6YU2hiXGZn5Dmg1l2oWMw059Dy0HCJ6e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210232

On Tue, Jul 21, 2026 at 11:25:49AM +0300, Abel Vesa wrote:
> Enable the CDSP remoteproc node on the Eliza MTP by providing the firmware
> names and marking the node as available.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
