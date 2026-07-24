Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603633382C7
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784907348; cv=pass; b=P5l/bM42Scvhm0vGsR+n7E7bRjyI1gNSxzyOm+kUj6HYd7HMbtqCDnzMkxYdjcyuP/OJDAizKgzaJRVrehOClJnFNqoeOQJEO73q1UGkaW91KhTDNrRcoId8nqsGMFe8YgDHU/42BOBrbZEPGdmRXL47wANKqRJmnGzOi9eozGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784907348; c=relaxed/simple;
	bh=0AxRvCjS4SeGauYtGrq3Gxj0CFvSuzE9MU+SB8VxZqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGqqxLSSLi73v9jg7Wnag0rDX0t6d45vGpgjOfX37/oMZHUebOZAe66kFDKVuIFlnrTCg+p1hfpgaV8LsLui+sF2tkJ0tzXO2Aqf0a2wyPHitwXzwZvjEQ5TI+CPfX472OBTR3dk+YdbnmTZg1Os8yWO1G0fiQgveJYKa3bC7Jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0UZBLpm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SVitZbLB; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0UZBLpm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SVitZbLB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbA523344414
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0AxRvCjS4SeGauYtGrq3Gxj0CFvSuzE9MU+SB8VxZqM=; b=U0UZBLpmLfPDvk4s
	5VVXy1GRsf9VjasKo9AZa15zarTyGa1QjJqnsNNIcbBeIhq1YHNQb+NLdvyNnDBN
	7R2Qp6iSbQ65AuK6J6JrFFQ1KCQdPr2+h/xLiVb0Y/MG478NDq04DnEdkLa8RE0C
	q+9xAuEvlxgPwplct6yAF7BlP/BSC51W0qX4xC1wqPCC2kNiVj4k938GrWe9if+u
	71b3BDT2ouTx0lPbmDcd2jAvWSKlChEuLO3YlNrfAItJPh+7d33op3mu57wYkF5k
	m5xvoz86F6mTz6U79nCSLiaxF3eZb68e4/ZCxZPnHU/bjNLEQ39PFmoJr1mgXWyD
	Gn0Tzg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cf0mvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:35:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-526da7e3c9dso8849921cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784907344; cv=none;
        d=google.com; s=arc-20260327;
        b=Ud9rEXuaueWQm2U5qEDuMLqGE2QUFnT0jAGr2HqPlWIgsIoekdq4Oy5H3xSPBOX2Im
         FKOe+9fzWFFnlciEdpxTkI/jVR4nC5w0uAy7eC2pw+gxtwifC28gjXP3s7jMzGw3a3Qi
         xAKwu2QUKc1iq60i7SnL4ucMOBP1Sj5C8ZLAJAu/ZMbaA2FMMa2EGt3Rpu9IriStwzsB
         EYZA9rIIM1hR0Mqo4iDcNlfkubEXI3YRsjXykHmUGuBcMYplreyvW3jQihYafuqEJdbn
         6eSArAvVTAspiYJSTk7SBMrgRsaU3ma5JqauPiGd0rXIMr8uDgvJ5Ia5LCoSog8NIFAl
         p0Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0AxRvCjS4SeGauYtGrq3Gxj0CFvSuzE9MU+SB8VxZqM=;
        fh=icObaPj7Kbin3RmBaZ6/0jPBU9FhAhh79lOQjdnXbPM=;
        b=b7nU48BkU2gdvtTvTOwwG+rrzSMaXeg92W2Wg0DAEsJNrPw+QsX8fb+EB3aX8EUgqU
         7yeX6ejKgnG4ThmMoBkph9Wkhwm5AkUT61EetrWi9W1HGrq24PRnw5NRfNoKSC6R+qE6
         c5cg+1FGtWer9+3eF5akMCCOwe4eW0C6Z2g48Sz+ceWIiXKcy/RDaaywa74BZYTcUGy5
         gikQDyNhoSJ8uyQDN+Vzh5DpSHhlvSzhO8iBSBafNHB+PbSQVIi3e9fKjU5S61dItwFX
         V65zGSxxm9tir9LlnolYDETP4frjwf4SasoNr9rLIRnFCKTOLcZnybKorL08kC/qPoeY
         WSmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784907344; x=1785512144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0AxRvCjS4SeGauYtGrq3Gxj0CFvSuzE9MU+SB8VxZqM=;
        b=SVitZbLBEQeqhXDYttKqcffl1bS8srPij46robugKSWL9bw3tuZrUUnPKAYt5pApKd
         tCBNmFfDUHtXQJAl73/hW25Eyn+edSA6L2iRFurPwLFpHJOpMd2oDiUtU1bfM8eyesCX
         GuOQOamdO7slnkWhiK5z2X2slT4JH7LANGzFtPnonmH2oQCU0tBOkw2W9pmfXYjMJDR3
         A4CSzAWZ2mfMacNxnuGzXYmaydr2aDKe2avf9dm+T6HvPdDZ95Wph9wfSJOiP0ZEAjvD
         vpeyuD9ls10BdyB63miOd4BGoIyQbGSe6it3/AVvHhHoFFdTyL7FhzRYem1esx6oS/jN
         vscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784907344; x=1785512144;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0AxRvCjS4SeGauYtGrq3Gxj0CFvSuzE9MU+SB8VxZqM=;
        b=SCfEokwe2SJWyr5RtWs660tSzb4dg45s6z9wx24R94o6oLM0exj4CVxClJWn9CAgs+
         UTOFNxZXE81Tw1AydQqOmeHM9SBZ0/hsokFBamXQS1T5mRLB0fvPOetCinwlxfPwpwnq
         dvMwRGroLOne5AVRwaIzOyCgC+kTVeLIVfTY8Jt1ATZkssWcuInIpynFQBtLxQs4PBXe
         3JCHUD6qMZ27BAc1dEm30s5M+7TjUURl1+moX+5I6gcfkvVpp0dPO7XZjAl+nO7fwU4J
         vMKl98Yq99ETw99PMIpNimtaTXRbfv66oVyH7Hi7rgdTIw2kQSTnOTJWvGf5u14zTZNs
         ia4w==
X-Forwarded-Encrypted: i=1; AHgh+RomomyBLh1oR8Y3TfzxwNxiKj/VY4Llj1qgl2iTyU41QS1PX1buTHTdVPlN/6iZRZxuVbSWMCCMd9tvu5uG@vger.kernel.org
X-Gm-Message-State: AOJu0YzLrJCNbfp3EWB4EDoqaB1coCr7i5r8KoVEaZux3Yo+snX5PGRS
	BuCzB8OLSBSKvdj2+fb2pMqpjSHESJfM/kmjhqLPDzqnJG/tMYiGKvAjmca7Q3lPP92WZ7KIwCW
	iXUltXpfNn9uXkifUs+9RwjjwrZp9k6I6Uf1Ri7eUFSbSVytnxWCwtc886aIvtxkNyhhD6gfun7
	oR6zIZti5eAnWU9ndMdUvE3XdktplF95R93wTbtotBKPA=
X-Gm-Gg: AR+sD11nEfj0L0WO/NnjsPvjRRHeXSxmRHew3KVWJ1VZRHwqADx2e6YymZFV3pwr/mN
	JbEnS/CHtNn1UILjkbBFmChBPtanQeZJPUu0iK0BcDR59VIrzmqSyIaF4Uo6b2sEywguCqo1cgx
	uxmpYSChqvvF1rKuq7XncEfkgUeBST4KB93qPXyoTaJw44tL/GWGrN7hh1kA==
X-Received: by 2002:a05:622a:228a:b0:51c:1241:3b09 with SMTP id d75a77b69052e-5283de54e1fmr76891141cf.39.1784907343488;
        Fri, 24 Jul 2026 08:35:43 -0700 (PDT)
X-Received: by 2002:a05:622a:228a:b0:51c:1241:3b09 with SMTP id
 d75a77b69052e-5283de54e1fmr76890551cf.39.1784907342860; Fri, 24 Jul 2026
 08:35:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com> <3d954cdd-6dde-4be6-84c9-2f2f7d008f5b@kernel.org>
In-Reply-To: <3d954cdd-6dde-4be6-84c9-2f2f7d008f5b@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:35:31 +0200
X-Gm-Features: AUfX_mwd1WNIZvdvXqoWeMIN9Hp4kEAy8VC-hn59NszviBxEKOIP4_juVgFnXVE
Message-ID: <CAPx+jO8-9YSJtXNfnTrUX_JiCyddXHn=wHek9=c99+fNp22Zog@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] Support for block device NVMEM providers
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzOSBTYWx0ZWRfXwfJm2pI4QeXE
 AvrJLfEjI1PAv/ffkyN595A+MwkEBDvv6sngHRw46WtR4n0mnmV3QdKqmp5H6d85bGQedtacBYK
 x2PToumoHLjmJLht3ELDV08za6u5S2M=
X-Proofpoint-GUID: 3M2lqzWdNaohNnz21IaZoHVBb9SkB8OW
X-Proofpoint-ORIG-GUID: 3M2lqzWdNaohNnz21IaZoHVBb9SkB8OW
X-Authority-Analysis: v=2.4 cv=er/vCIpX c=1 sm=1 tr=0 ts=6a638650 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=VT4XjZGOAAAA:8 a=EUspDBNiAAAA:8
 a=XoVDlNqzt-XzKL8N3f0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=6CpsfURP9XNmmWg3j1mJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzOSBTYWx0ZWRfXwch32qJXHsSp
 KoBJ7ZhP1U2KRxxjofX0xJxCvxRTW5NhIkHNql4wCkV1lpMYVSlSsH18RH80kgcQyy3IesBmNpF
 ZT/8lwT25+FVkLNiTC4dHvPiEXhaQA/qVKa+2AUgEs9hIYo8v7JTp1BFcdNIK+7b9JE+m+aBpzG
 3Q4U5DP7dugncDBka52ipi9lLqzAjeDe7ZfrGiy36zlXwr2lnGkROod0FYeg4tRRBLzbp5+0gpx
 amAwijWeIspKNplcfJUtkUwjDErjmIVqf62MuesEjzAsK3Wn2tc+Z1lelcgtbR90P8xKwQjzl8T
 3ENics7BINTtwhhMkJrAbPmQwY6yH3FF67RuAHAelmbyHrQBT+4mXceKNm7cEIH1Cop4jfBbVgo
 BYzALrjblF7JDiD4zrNf+mpHvr2sTwANz92GSMs2hGitOzELNUt9tECr2weD+6CRZP8+7UvrgnS
 5/sjNFKQ1diS744huiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240139

On Wed, Jul 22, 2026 at 3:56=E2=80=AFPM Srinivas Kandagatla <srini@kernel.o=
rg> wrote:
>
>
>
> On 7/3/26 2:45 PM, Loic Poulain wrote:
> > On embedded devices, it is common for factory provisioning to store
> > device-specific information, such as Ethernet or WiFi MAC addresses,
> > in a dedicated area of an eMMC partition. This avoids the need for
> > and additional EEPROM/OTP and leverages the persistence of eMMC.
> >
> > One example is the Arduino UNO-Q, where the WiFi MAC address and the
> > Bluetooth Device address are stored in the eMMC Boot1 partition.
> >
> > Until now, accessing this information required a custom bootloader
> > to read the data and inject it into the Device Tree before handing
> > control over to the kernel. This approach is fragile and leads to
> > device-specific workarounds.
> >
> > Rather than adding a new NVMEM provider specifically to the eMMC
> > subsystem, the new support operates at the block layer, allowing any
> > block device to behave like other non-volatile memories such as EEPROM
> > or OTP.
> >
> > This series builds on earlier work by Daniel Golle that enables block
> > devices to act as NVMEM providers:
> > https://lore.kernel.org/all/6061aa4201030b9bb2f8d03ef32a564fdb786ed1.17=
09667858.git.daniel@makrotopia.org/
> >
> > It also introduces an NVMEM layout description for the Arduino UNO-Q,
> > allowing device-specific data stored in the eMMC Boot1 partition to
> > be accessed in a standard way.
> >
> > WiFi and Ethernet already support retrieving MAC addresses from NVMEM.
> > Bluetooth requires similar support, which is also addressed.
> >
> > Note that this is currently limited to MMC-backed block devices, as
> > only the MMC core associates a firmware node with the block device
> > (add_disk_fwnode). This can be easily extended in the future to
> > support additional block drivers.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>
> What is the merge strategy here, Am happy to take it via nvmem tree if
> all the non nvmem patches are acked or reviewed-by.

I am planning to pick up patch1 (dt), but waiting until all the
complete series is ready to go.

[...]

Kind regards
Uffe
