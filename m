Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794026603;
	b=cOn0SMC69V5AZ14E4F0oLSGcUAOCevuJI49JmtB0QTo1kGJOBeoxkXfJqx8+aLEZi9K1
	 2l8Kk3/G2smI899aYcN6j6mQohQQ/yc5tGwu7ZLiEAKOhWHvM7Y9A3Xn85l7cSGhHtFFa
	 g/plrGTWDVlXDbdnWUGhpG8yKCuPBVefQyPm2nLc24kTXx+KEAwdZn+ZuIyniOqK7p8ul
	 UxinNJth9TIQI4RuUohKh2kz/YJZ47wnwf8z/rJ5HZCImtDJ9XtdLGatIQ8rb+f1PfK38
	 SJEFBgt0zIwq85Bge0VKeFyrJGhxcXJUxsDoqgyUr9rmEcvvvch3YO9FkTUmFgtUOCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026603;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=b+VmH62ABNPAXkSzeLXOUWJyAUNp6hJ01xdXPzH/7e4=;
	b=g5jk2P6QCdZjwQL09vxdBY4S8Utb3gztlesfvGxP8wu3O8+DOveSZBrCEMN+d/BEKeCs
	 UuwylIO652a+/75LWsDi38tsWKaC2lhfWk6xIuw321vbafkYPvgNIlx37wUR8fWUa4JRv
	 W5BVN/VRen3/GXpMI3VhoqoTGJqvKHm7oo+cvshfGUnTDi6h7UCyzsWWAAOZEsphvlqmS
	 dvy/tMHM5UXiGwyzRPabfFd0bAzkkoyW6DUU20PoAx/cPXETRYpOKIQEM4oTjGoL/GqHk
	 Mg6AcyhM9t1UrXo0M3dHnnW6wXDw/0IsI1o5OBpmx62vjG0le8PNc4u5Yh0K0IDCe1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VXQw/dZe";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ji7lJmHa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF36B606A32C
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 04:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF36B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXQw/dZe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ji7lJmHa
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A72Aw3v568497
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Nov 2026 04:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=b+VmH62ABNPAXkSzeLXOUWJyAUNp6hJ01xdXPzH/7e4=; b=VX
	Qw/dZeFsTGMBxP819rfn+TGMbCQaHroanEkDnJrtwq6CfkiV6FjfWeLmsKrmHcLi
	9EQ4FcXRhDxyVl/L7KhCzef1tFwtsGuHP/4M9et8BTkVbnC7MhKAMlepDWxRgmUh
	rWHj3Z+y9KXVgrg3vTF3Wf0XJUCmZy/wp9Rj5tPiOCiLhXHlJ/NhuKD43zmDZmrh
	++0I83DmOqDTUV1VKTNosuDfsZEffxp1aI3B9JfHZ5VqXxPpSqa3uTAp6pOVt7rY
	PMJ760gZQ08Mkz1GJaTpjY4Mopq3WNTWROdjxanR8u6hr4K3lPuY7piVrayeWLrl
	zq4Qt6g5oYRV7hmyB9EA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyk1fhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 04:43:21 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6e1fc036608so893875eaf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 20:43:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794026601; cv=none;
        d=google.com; s=arc-20260327;
        b=Oij6MhIzecRz7y14kzIOnzsuyKiJoMLrVsmSi7780vj93EL4mjxaymxdB4xd45r6jY
         E1/GTBmXI/88CLKihYMqqmaGm8nbqUjGf4hizzDzBIaRrQ2QduqMpiR2bbR/YSgbwQL4
         0d8C4qS0JO5qfCxupQ9ZWApnU5Wo/OZpr7mDDgDKHO7du1BrtqYfNcXSFeppgGCgUjjA
         Mcq8J3kwFH52GP9Hsfc9iEPE3VWxYQPDi/pGTPY4v/JGbZovh7EVR+1sMAOkLyMag96b
         Qu6lxV7fp1m135Ue2V30tsV3TOn3sDZNSsW6q9IqwMMO97gC09/zn6OhjoImApoKlJjU
         wrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=b+VmH62ABNPAXkSzeLXOUWJyAUNp6hJ01xdXPzH/7e4=;
        fh=xw6UlD9UoSVnDmZapOPQerZRH9j2k3VRMumTAlWka/Y=;
        b=nBDDmJ2al3vbKwpEOXMkxmGyUNtocJcyyB1qpXPj/iTP7m+eY+UOzouGFfkSmEAnGJ
         zTRb3x7E6QqWj5usaa3T9E90QKnGraQ6KNgYV8yAIL1kT2V1sQT+zR84q6Bt60+pjush
         wH0JRi6NXCAhND4mFO+cDc6P/r24Fk0XywxdPIqRMbG0dPtmaTtjWHOZqgj56feYzOms
         j4Pk47jz4yT4OOk4vuZQ0KSwSojSzJCt8gRt34On+CoUwRNZyyyzU0BLiIdFl9yx9fSP
         z7VY5CdKeir+hqRmGjhWq+zLSSPCUmwmSwpSrbUOS+eeI3dqGb0VWuT/EyjBKV3gf2+r
         6xDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794026601; x=1794631401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b+VmH62ABNPAXkSzeLXOUWJyAUNp6hJ01xdXPzH/7e4=;
        b=Ji7lJmHa6aGI/jNe1y/Yjnif1tV32+hHaHXV2ZjyBqqRoF3YhYUHqp3TfyXjHPmMUK
         tQ8f+BJDl6l/dTreh148gF09wezOZfCUrAZTAi+xXF36pG8vw1ea9YmDU040KCCEGTSd
         tN38KY4eQ7Tk0KAR2MkqHvWG7GnYXuZjeDfkEqoHaRFePbZAjmNzC8qoFEKEGUwyD+AT
         qZZxf4F6kV3U7Wt82rCTDuDMD11riqdHeUGiXxrg5FlfDHh+l7j+U+HSzgoVfZlWd9ao
         Kb7cnLzCP31t+IIZc7fIm6sbjrXNZAKNOuB+ntpgZnKFY/DFs3wR6Xa7NpUR8LKgPJvf
         or/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026601; x=1794631401;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b+VmH62ABNPAXkSzeLXOUWJyAUNp6hJ01xdXPzH/7e4=;
        b=sUdne+7lWHLdiko1Z1AcPa4C+mcHuzCtHG4Ovk+PcRMu80mPtlqs6rcVW8iqcWfT4q
         O8xCmXQgoSRMwUphYCKDGhz4c4WCUBr7yJwbaBj2/pqi6d/JYKgRshjh7vhGzjgDHvYw
         FzaLYCarPxZWjQlFBOMLnbgvsvW5v+mnqJgR6r8/5eeHjibSmf69ox0BEDAr83vPF0+a
         kIqXf0bRZkUXfTjUIbkbbJhiTWLaI3Rt6+/0HXa4WoAju/Z6VfUf/mAsRDi3vZZCScm6
         zjaaNn0ZLeSjg8XKAU+O9+B86DpTP7x4n5Nd3MtNLMB5S2JxfzAgiykZzdTIW7+LYoy2
         P6hQ==
X-Forwarded-Encrypted: i=1; AKwUvBydfAe7iDO9zvE1fMxYSn2+I/iZXHwn471pEGtvfwudw1kxJ5Dvy7Yj0oM4OCOpZrGRaTCXoHLUYTYVQsKk@vger.kernel.org
X-Gm-Message-State: APuU4Z8lKQHE8tAMnjOdJSOBmepTAfTENRGHgOrwttY9VbyoNoi60wh7
	ph2TuLh66I8VIngyFk3rH7h4t6PQftEuUUBMEjZ/qGVo+ZMtUMIo6cCoI/v/tD0y2oqIook39hi
	7m6AJBqNsEQeowI7Oo95yRwm7Pg8L6CrgLzesZEvPp5kivQnaPtXF4I8FTfKHm6GTIe9Q3HGoi5
	xep5fkPCLBhjIvy2NWLC7yju09FVUx0npyorudnbQM8zFRKl8m+Wk36w==
X-Gm-Gg: AYBFou0hkoZv/HywWN4kZta8Vvfkz7gticB5wIkyQX/mlnnWFEHF1WCgUCGafNvDQz2
	mwTUoFsm8doqN/lENKta2rcA73xa8Y/u0oF6I7s7hbOj0ICfLqDGTed8rakKAxSiQAbh3AjtBqQ
	wrUlsK9mPnZo0ynKw6IXiNtD/DNB+heWr41gTa2ctl7NRJeh67pdOv/Zg9jbbzYnCo6ExWQ5Gql
	bMazVDiBFWn+ZWjRLMOgA==
X-Received: by 2002:a05:6820:340b:20b0:6fa:f881:7bef with SMTP id 006d021491bc7-716e7938ab7mr1898641eaf.46.1794026600918;
        Fri, 06 Nov 2026 20:43:20 -0800 (PST)
X-Received: by 2002:a05:6820:340b:20b0:6fa:f881:7bef with SMTP id
 006d021491bc7-716e7938ab7mr1898634eaf.46.1794026600505; Fri, 06 Nov 2026
 20:43:20 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103011358.65398-1-val@packett.cool> <20261103011358.65398-5-val@packett.cool>
 <07d29a8c-1caf-4041-8c01-845a51d11a68@packett.cool>
In-Reply-To: <07d29a8c-1caf-4041-8c01-845a51d11a68@packett.cool>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 20:43:09 -0800
X-Gm-Features: AclHuK8ZvCB0v91X3y3MGuHIzYr_FPdHK9w1jmFQ7gzccPmsaAhQMvCJpL68CKA
Message-ID: <CACSVV01eJ4sxzZWC-RxKW4OLvXPmC-auru9-wTFSY-CPQpRVnw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/msm/a6xx: Import a680 hwcg sequence from kgsl
To: Val Packett <val@packett.cool>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 1sAjfdO9ybPUFZup0FnPxPsqS3HUEbHf
X-Proofpoint-ORIG-GUID: 1sAjfdO9ybPUFZup0FnPxPsqS3HUEbHf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAxOCBTYWx0ZWRfX8/urWXhytENw
 88R+qNttZYXd8lC+Kz39+k4wtf4rbMQ6qr9+bWr1GH3ixf1TTL2UU3Imxy4AhWglyt114v5x3KK
 +QtlBIc05SpyM9ILGupGsk+4Yq8rDgE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAxOCBTYWx0ZWRfXwmyqJbtBLc+Z
 hWF47IwJtIZzXd2dal+3Q6511UoR4dy2aJHRKDCAXQIjWAqmpqBNe1x5csCvp43ICuTA0sEvv8Q
 auDyYi75KVkhVdFYCaTOsMqGBx/2yWGiUIfEwYGtin38aLMd8xZn9pL/nUy6dfcufZR+mrXaMRi
 qaEuMXiJhmwmHH2sPT5cpsXVJpQvZut1CMGSdWLWe9nDzlZ7Ls8g6Aiao+0wnxChJurjECinO3/
 rab49ci2g0ey1idHLK25qES5zV+jfeTP8d/INEy7+5RqxMm6dTiXpa8K3fpTgmjOMliI17uN+pW
 CT5xStgK5Foub22ezdMvxe/gVF0bpfqki9PrA6IpoZNbi8CF1cD5RPQt7Fc2R1tCBl5MMo94QAZ
 deFofrft7HMdlOFeTpNYPGqyUtB4WbULpnjRiO4TPHpKxJ4QKFiJulGhC/vZKXmQL80fZHfLdat
 /7gyOVXuo9Dmq/9ddGA==
X-Authority-Analysis: v=2.4 cv=I5Tw19gg c=1 sm=1 tr=0 ts=6aeeac69 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=e5mUnYsNAAAA:8 a=17JunTclo9ORA5DUsrgA:9
 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611070018

On Mon, Nov 2, 2026 at 5:39=E2=80=AFPM Val Packett <val@packett.cool> wrote=
:
>
> On 11/2/26 10:13 PM, Val Packett wrote:
>
> > The initialization sequence for a680 differs from a640 in a few places.
> > Match downstream by using this a680 specific one.
> >
> > Signed-off-by: Val Packett <val@packett.cool>
> > ---
> >   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 56 ++++++++++++++++++++++=
-
> >   1 file changed, 55 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_catalog.c
> > index 6c154792cb07..48197a54984c 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > @@ -9,6 +9,7 @@
> >   #include "adreno_gpu.h"
> >   #include "a6xx_gpu.h"
> >   #include "a6xx.xml.h"
> > +#include "a6xx_gmu.xml.h"
> >   [..]
>
> (As sashiko confirms it's not a good idea to try to write the gmu regs
> from here, shouldn't've gotten lazy and assumed it would work anyway..)
>
> I can make the gmu driver write these on init, but would like to know if
> they even do anything interesting, and whether the entire hwcg sequence
> is worth it=E2=80=A6

vaguely related to [1].. I guess I'd suggest to do something like that
for now.  Longer term still tbd but dt gmu vs gpu split makes tables
generated from hw view of the world run into these quirks.  Longer
term we'll do something to clean this up, but not sure which route yet

BR,
-R

[1] https://patchwork.freedesktop.org/patch/767327/?series=3D176505&rev=3D7
