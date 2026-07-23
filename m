Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5D2385D73
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 19:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784835591; cv=pass; b=s6roUaYRsJwEOu5688HZZ9pqY7LI8qeMZIgl4AA6hLKiF0K2nxraMCMgIRjX9tiCB18pbtxOpUq+vVsuSSysqx8ryWee7+paSufc9JMFIl2qxQrqbewdPHzz11ZT7vtqlHxpSFLiw9wLYaQFLRoUHTCZkzP5O9gCvXkaYfrGz18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784835591; c=relaxed/simple;
	bh=OjmerZlh2Ae0w/xoRAIqaoUMyxV5HsJ41pwEyuiHBsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UrxE2z2FD7T18C8xKhNNXbn/Ca8nvZI71MapEQqO6xgEfwjD9qOEkdlc4Tvgps9N9OnBnO3KEDjqgtE9zTdc5/iEWgiyY5d6zJ0/5aaO5+iseQJ+Ewz16SbUKONkdJirs4uivsrcq+ckr4vtomhX0ptiwDNyK0z8q0T9SIXr5mY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYT7e07F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gaIE1ped; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYT7e07F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gaIE1ped"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NIlv8u1844125
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 19:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k7gjuT0+aFniLuCctCVMtzeg
	Qak+FZ7MzxxwdoW/+fw=; b=DYT7e07F7hb6HKcF6rLsSLvkEdUzswrmLe3B1U6+
	5IkwzZGdx1bJrWgoPufsLDZE2P5l3TfGFm16G2CuMXDqf4Eq/ohaQzgnKQ9cJXEQ
	11w79+EX5NBwG5bHHR73GQ/FpJQS4P2dxzhEj7qwq2NYHP2PfvNk1DbmXIXzNPIj
	/ObytEmQmbI1U15aoonSVvYfk/IsyfFyo5QiTbFD3/zGcw85l5VTGFwCzyuzurbW
	WqGdFJfR63jSfvpLemOgFccaGLKuF+BrhD9gfplpsL51ssng/5S6Rf55rDIAMUGp
	8K9xTK+g1NWN7xj8P6/MwB9lZQ/iXdwqwBZzQan/OgU8kg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkn9a18yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 19:39:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb7049fa552so854445a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 12:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784835581; cv=none;
        d=google.com; s=arc-20260327;
        b=hR9bEJxz1x25wQuNK1WCZ24xUilDfsx7wBFbPqSh5miIBuNCnnjH1xVzZ7oUSF6fNt
         RNI+l73Y7LzsS02+7JEyZZkonIc9OkfjC5oCTo6l3gIbIaIxCVNmCodTj0ev+SgqNzXJ
         2nUrNPa4rTu5Yp2hNuk6267fwZd/Bn23UTWRfUpZLmJ1Cox7cp2vXRHufGscbB0qm9EO
         WPv/zI0tkRypQbOvc3po4wLBH/wm39N/nQia66FrvC9BOFyDkWGI9iWAWUvkXbzBC8EJ
         RGu0659NJjCPHhX7qKRORzoqgIa7HZTrd3s2Tz7quLtsYMLptnJ6jZa7g1whvVI2Mh/i
         tiLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k7gjuT0+aFniLuCctCVMtzegQak+FZ7MzxxwdoW/+fw=;
        fh=BzmJIxO5JODq62XZybOseQ9hJJfE+DjSUmBCfd4SQK4=;
        b=b6RWRj9DJug/6sgGLHiRonXdT2hLZcua4WVwNzdDe7PMRxmTrG0iYAUyHhGia/6+D/
         ehvAj/kezKXHpd2eVpDNZnsT2wHCvqsroFMG+ou+ZhM20sFok8qfOEHARfek/1AbHaWM
         q40cl0Jiw9OYdCp2wodqPVuzmMRlFJE3EMogZxRQYm9CWk58niN4F0Y/PZJSlOXSkNyX
         F47U7st9ZGYLYwF3/lS4RhFqDovObETmK2wDYmCgT3FN1TJ6IblZBpghfwEGPRGXviVb
         OPDlJmnu0RUfXnL86l+jE/qn5aOHCerkGEV1bqTYnvtIqb94IEh/US3l9tJw75hFYyeO
         Ea5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784835581; x=1785440381; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7gjuT0+aFniLuCctCVMtzegQak+FZ7MzxxwdoW/+fw=;
        b=gaIE1pedS4aRUGz7B8icVfdQo8WnLNkeo21uw5b3UYqH2QWKcgyicblb0/1t9vl8g3
         N/F2nIFUILxT/+EKjHJS6+7GoUtSTQG5LKawzpG6Ew8J9bftyLeO7qvqX1fJ43zjLbyp
         Hmi6T4vF36X2ENltc6NMiFzTMlum2T/07tJUi8vUKa5A8GVNqD9+v4QVBtz+g2qSOaes
         kaE4iuNfo2QkO7HvhBWMcmPxRmSFXNYjTYdUBEFUn5QXz6MW2WQn7yIyvu8Spb9kd5Wz
         KnZWBHYIA4v+l6/8U5I7lTe4V5LmdDjeIwX7TdYx4YIrZ/DFXLDcgpxPpJO90li+4eyt
         +2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784835581; x=1785440381;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k7gjuT0+aFniLuCctCVMtzegQak+FZ7MzxxwdoW/+fw=;
        b=UsVLnZZ5uGtthT5Bd7mX1m9mKfU1hoE1PFhwuXOebgVoC6dwFczwfSTqhwJHBZ3p9k
         nEIgOu6p3VAo16ILCCvBXvRXBu0dNlyaFVoTyQPwB696BRaYC/lPJoYZMmaYCgRJxZHA
         AtgrBo5Oigb+4iHMitX6FZ05q9tryxpBJY8FPS3YVITuTQnOoyzpU8mSlKzA+6rahK42
         vvHWIZA9C9IDNq1qygLTmOQ+ukejrZ9gq8ngQN46KFZOI1POAGhjT3uJYyeVvoHzy8sl
         WopIBXSCIs7+O92L6e8jyWSj5Qv7dk29HJrJSEbOq2Q6YlRQdshyZ0Q0TZi46z7S3j/6
         KoMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrG2qWZxbKRT6HVxTdn5UxHm1dbSwKHuUwBJMaAK/evjTu0e8Rg608+FhAKzVaZbc4e2eL0zR9IBWmIm6sg@vger.kernel.org
X-Gm-Message-State: AOJu0YxpaDB4K4oN7syCbeKMZEBlti2R3OBD89N3EVDSfH62BcZWUutA
	gkZ8ir2lviDeAeX6uQ56v9pjUzhtmHNWt4rHt4kA7pDoLxMBaMG2IZlfHldFlGdrVdYjjLgyMwH
	jGhunamWaYfnnus61/vCINkSCQVQAwTUQUsMTtiu1m8WzYWo+hLKZ5vroQWASiQN8jNLKclqczZ
	9ny58ZzeGP/Mh/4Q5TqyJ/bxW54Q5yQbXBBZXDv859sMc=
X-Gm-Gg: AR+sD10TG1UjsiVUlZR2CP8jcNcjxGJQUTPAbYvtOxNBELL9WpP+UDUn5qnLMPhx2Ra
	99IAfxez574ozOgSRFUdCYh8FPA87mIVfhaXCmB/FV6VTQtoOW02N09PCDiVzwdVNSYPTc9VnPm
	SH5jB2GJPV5bl+MAy+xolYfenMGH/TZbzZGdQI6l4dtfDNgwtU7SgenkQF
X-Received: by 2002:a17:902:f642:b0:2c9:c517:d078 with SMTP id d9443c01a7336-2cfa6c7884bmr52774175ad.36.1784835580622;
        Thu, 23 Jul 2026 12:39:40 -0700 (PDT)
X-Received: by 2002:a17:902:f642:b0:2c9:c517:d078 with SMTP id
 d9443c01a7336-2cfa6c7884bmr52773955ad.36.1784835580214; Thu, 23 Jul 2026
 12:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
 <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
 <85f2799d-fadf-478d-9f3f-fb8ff91ba84d@oss.qualcomm.com> <6a609d87.87c5160c.1accad.0f33@mx.google.com>
 <CAO9ioeUw4QgW47xmC58dGc1_j2UPFjDM+dDRF-bggpBPFA32YQ@mail.gmail.com>
 <6a625f94.4d70c427.b2b96.9b5b@mx.google.com> <5o4nyr5iycpgopeo5dllygtndbp24g5ejqvh43d3mxwnxufork@zds6b6aqvcqf>
 <a6f86d96-48bd-48e6-9306-159b17380ff8@sirena.org.uk>
In-Reply-To: <a6f86d96-48bd-48e6-9306-159b17380ff8@sirena.org.uk>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 22:39:28 +0300
X-Gm-Features: AUfX_mxHE1J6imuCX4kEX4NevKVebUAQ8I-BHSXEMNlUFDgV1mwWb5gbYYJ9FqY
Message-ID: <CAO9ioeX9LjGLwKGFj5W0Gwh8X8_+E1e81Wb36vAHHzg2ZDf32Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: qcom: remove ipq806x Storm machine driver
To: Mark Brown <broonie@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE5MSBTYWx0ZWRfX9fBVHTlhEpL4
 Z+BHzkS0Qp6lzhbovvSAqLa+AaXj3CD5bPA4hEWkRgcbWOO68WR1w3fX5tcdTPXY8IKcVRzWmH7
 ssinhCQm25nFqwasOOT+jYVeAHD5s1nuik8Y10VK9OwUk88BTBwGMQSOm1Z6u9hCX/GBC2Vxd1X
 1q+KOuP4odUlxxZVqtEJ/JTbahSwMNgIfxs5lSYym6lBuYbs7v+3V66L5xMqn7MTtIu9ZjHE4vT
 uilAJNpHvjb1qZBUshJyyqQIFjdSI+ew/tBD6sHl2WEQnet8QF7diM5BjUvv2KXfw0fC7JG+aT6
 t/vWcKBOjGOVZNetluzBIoXYw8Hqj92+uqgY2V5j4qq4vtQjLi2wmZ7b2C23fXCBDXQBj9aLK5U
 ESnfgpe+FxmrxdMbResptA6G6NvuzBv589yFimtpTJOcqoP9gDZZxNNeRvAakaO5uTkGZ3ZkQfH
 +UUsVvBqNZYtCxAGDrQ==
X-Proofpoint-ORIG-GUID: ENjhRi5ug4U-m3rKn0-oMPI7zYoH_Uy4
X-Proofpoint-GUID: ENjhRi5ug4U-m3rKn0-oMPI7zYoH_Uy4
X-Authority-Analysis: v=2.4 cv=WOdPmHsR c=1 sm=1 tr=0 ts=6a626dfd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=7tSWEDlCfLhq9vGkEV8A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE5MSBTYWx0ZWRfX6Z2MYYqixqSA
 vqw5NQDqldTaWvJa4CsI/1g6ZOHYfbN+ZelSAzR9GL1rKkyrlE3R/4xvm0sCRO4bK+hhVL6aUcE
 AstEgjI8BFRVhmZzdT5mFYeEpyd6ZJ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230191

On Thu, 23 Jul 2026 at 22:24, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jul 23, 2026 at 10:18:47PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jul 23, 2026 at 08:38:09PM +0200, Christian Marangi wrote:
>
> > > Yes on OpenWrt we support 3 OnHub google devices from Asus and Tplink and
> > > they also use the storm driver for the strange attached speaker.
>
> > Ack. Then pretty please, could the OpenWrt community please contribute
> > those to the mainline. It is a quest and a process, but it helps us to
> > understand actual hardware users.  Not to mention that getting platforms
> > support upstream would lower the burden of rebasing on the new upstream
> > kernels (assuming that you are using close-to-upstream kernel) and it
> > would also save from similar cleanup attempts.
>
> So should I drop this series for now then?

Yes, please. The driver is being used.

-- 
With best wishes
Dmitry
