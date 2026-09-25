Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01B34D9545
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 18:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361738; cv=pass; b=mpxBAfdhgQ5AZus4Ug1ptODggWHJrP2gTjc61F1xWUqmkIbzGafgvSQ4oaH/QN6cKjMAAkd/0BXsSwy9qqBJTWmRLgeMXaAKyN9kIThlSyBqI/Jy3gyuYUSHxU+w0eAWn2gYB8WMv4Y9Q3IOGu7cEuL5NYBTXF2iyn7Tr+jhJKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361738; c=relaxed/simple;
	bh=qe35OzbfSn5jxEUxVU2cmzIGiFHK7xWuk7f7gKumZ4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=db8uZ7w6RdiGOoWCrlBASoZ3akldLptCllYNHWiEGMyCTADgVY9oLcM9vngdTHMBTo8LVcZJFqzWeSrZJLDW/VaS+0pUSmg19KZXjYV7Gkr0Nnf81QbBXvprsMQXDAEKM5sWA2OOJi6EuXnMId/FiDHmrGmaTF6yCs37LMdLRAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSlUeud9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MLqMAtOF; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSlUeud9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MLqMAtOF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG0HC62643859
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 18:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m3xDk7u5dmLP2jxW/XWS3M+3d/I4qMp3Fvvf2xNBdKY=; b=aSlUeud9MMrnTvaE
	fBNW17DTlK1pd3VcwQpUk4ojbblR/A1hMmRDFhOv4r5cy3OVu8i2q6RmCi/4vkuZ
	vUfJnemh4SMXjd7YTf5sbLQCTkc017+cBse1LMO1nsJkHCEWniirrH+WKHG39Sy8
	my8Qbas7L+ScsIZTV2pNDMGhJ3LWocXSDZvk5Td6QyumagYlnF3T/M65woH/CUay
	IGqzzkIMWOsK+Mg9kxItyfWdlSbMOxtpgASz+AMsYETe9UpdCinK6WF8DBzpNC6p
	SaGtAz+max3hYXt17goBn1g67FdMVjHnVQNwOXVfg+HpnIOlmupIwqr2msOh/dir
	1yJ5vg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwufk0utv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 18:42:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390a2c895bso334653885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 11:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790361734; cv=none;
        d=google.com; s=arc-20260327;
        b=BLjIfa19uvDzNPEg7K7NLR++s6dA/PNwZxVHkmgFCVPCslbF6f2fPzAxtD6a9wmQBp
         aaP3EWJaQbeASmAJoCBnSuH0ory7HsxBdesII6ALFr9e7vyGX9emHKh+nHd3LpifFurP
         3ele6z6eWTIh7ShlznZ/3Ps5e1cGYbIHuMgrU9MqZ/YhZS5Ha7KmkoIQINSQDamBVUsx
         W7eAj+lhIjFDsjMlVIADRaUJ2vR4iOVW+fgJ1yDt9rs/hf0eFPU15lX1t29kBl+C6mpE
         Zrcu3C6ywRE/y8IoA00c0F+C+2bhxVPkhuHYLphB3kP8VG+HDGE1BFngAvr1my+ELER4
         ap3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m3xDk7u5dmLP2jxW/XWS3M+3d/I4qMp3Fvvf2xNBdKY=;
        fh=Y0flkXomd1Di9hUTC0Y0QFZ43kgiOnaWMHCSq5EHhLg=;
        b=HT/XuFaOKB+eljO/5wAh7LmFSYrsEYdQrfWqzm492NcHGUzoitkkyNjIpWyp3VzCJF
         iJsXrWI7wsCqaEsKKYYaoofwk1x9GGf8hynRLXX2w8EZ98Jui60sehdCPMrpkzkNoHAf
         NTbVgysuQPv44sWxhHX2cKauMfjnhgqXq29H/TQNPKbuP7zyDvK1Uuh1NLPLcKPdXZK7
         zCJQguTcFCDRMkioOqX9YtIKI3FyLm1oT+YAgmUoGSvoF5CxiM0XzZBFdietpmyDuGs/
         IkNjjjB37gdQ92R29QhNA1+LjKCjOP6gfrsqUem/M+MM/Mevsh/TMogdoDzOhMZ9xLkA
         1uZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790361734; x=1790966534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m3xDk7u5dmLP2jxW/XWS3M+3d/I4qMp3Fvvf2xNBdKY=;
        b=MLqMAtOFgcfL9/esEM7x6BGxofK86YIE1Fei2550rmKgF1kyAQlJ7ay4c9AMp95V5F
         9yVqR3MeECJxN/rljFLWY8Y8cH/y9dErI1SDMfWjRP2T6c286srna7fLafAgf12jJNhb
         C3dUd0We4dWIfe51+7rlrCq4o4SInafcewYvXgEfvqw032ew14t/HA12/kHlUjnorEzT
         Xk4FEBXlguoF/nQB8KmmRq+ZkQq01LvbBb3469/GB1/ktBO+P5lX7PuPxO2z8L7DaBId
         ZzYTL9r+nufOK+2xNUxp1fhF8PNMKIoObRgTMhZiPFhlIeXx0EXSKM6iKcZYxwBqOAmy
         v8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361734; x=1790966534;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3xDk7u5dmLP2jxW/XWS3M+3d/I4qMp3Fvvf2xNBdKY=;
        b=O5NNbidBpm935g1NL4NiLi5HZQjTVm56S/5ax2b4rNAYsRpB1gKv245eJR347jyzH1
         7CxFM8NXYyiWgMylLmDAuKmLezeYR8ynJlMrge3Oi1JVne1i5YQ3alplgoVAMyn9i2zf
         ZTPw3ElP4bzenLrbJQAywGu+/qYnsSlbSXkPDHxX+7LcVWKZTmMspTb2L6IIj89iwmsN
         IpjsgKHFoEe97iabylQik02tSmX9y1mRKShhDhnRKDrblIj0E9vIUXgsIJix4x59uOJK
         P3mTPXGP+12OrrX+nHtzVwpOu78ZPXzpinVIMvvB0Kk2dYrDI2uszVTJweUJE3rOGuLG
         5WKg==
X-Forwarded-Encrypted: i=1; AKwUvBwZZb9/K7me/TUy+NvKeePS2v0XPN8GTQ3RDirg1j43ikLRdc7x+IaRcVwMZ/1daSGfvvFpt7QGG9ypkqwh@vger.kernel.org
X-Gm-Message-State: AFuF++nldT7DRtqUd91qq5bDJLO5fW+tUwj5uW8cSFuG08Ny3R+pz5m2
	9MHfLg//kHg0qt/i4q4vCUms/Wk0mugjHawVjmnmT8U39tQCQFvB8zUqE+ttSri+56ZdI4opOJT
	Ork8CeTFyVVeyJ2aYcvR43EZck0sc6z94xb4roIy4yZym6rwHZnuUbJEKVCNO3wusNfbv/z6O9Y
	sHpzxygPo6QweCCwMHnRJe1B86gF840nhrHBpWV8azea8=
X-Gm-Gg: AYBFou1CIHdRjrof2s7D1Kddhg1wdlIMh+Awp+t5WVHVMd6urg+VcrDL9iu2Ono1dvU
	JLabbmRZCSZ5M/HLGxYfTawJPUFN+0ENER03Wxm46zbeTQmOPffPqh6/SkyupiHsPTHz4nfMwHm
	6QsqYtD8Y9J3f2o74hkQTzndkwEqOUPYFTlUGl1XEiJPl+P61+w9xav0INTeirNzoPWl4qpR2SO
	UAhh31FLAu7TbEwEzNhx9iqqo2OzBs3H+3SJsPAESVjzWfOn5c0J19MjBlBuF9ZN+J0xri7qw8w
	cPk2InTiTe0a5Ljqt6Ag4Yu+qIaJ
X-Received: by 2002:a05:620a:2614:b0:93c:e83:6ba4 with SMTP id af79cd13be357-93c43cfd3cdmr614937585a.25.1790361734034;
        Fri, 25 Sep 2026 11:42:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2614:b0:93c:e83:6ba4 with SMTP id
 af79cd13be357-93c43cfd3cdmr614930485a.25.1790361733529; Fri, 25 Sep 2026
 11:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
 <178998281449.889291.7893229102394463283.b4-ty@kernel.org>
 <CAFEp6-2P14MdYJGuH6ygRL4ZKtLnJEj=PVMx2p+b9L1RuiX1dg@mail.gmail.com> <f8815dd7-1e31-4567-8f12-1b2b1dd451f7@oss.qualcomm.com>
In-Reply-To: <f8815dd7-1e31-4567-8f12-1b2b1dd451f7@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 20:42:01 +0200
X-Gm-Features: AclHuK9eWyYSXO1LoWJtwtSLZuLm-A6-I11eiFIWKFJB95hJR5ZP3c6jJQ_Yo60
Message-ID: <CAFEp6-074kS9GO2TFcR69fMjuu7Y2Os68CzWs-KUfmZDYaPZ-g@mail.gmail.com>
Subject: Re: (subset) [PATCH v10 00/10] Support for block device NVMEM providers
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jens Axboe <axboe@kernel.dk>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Ulf Hansson <ulfh@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
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
        Christoph Hellwig <hch@lst.de>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: O_cjV9owRSsmuIyQZ4Ya-EJSw7o_f_66
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA3NCBTYWx0ZWRfXwV58Khkboia+
 nioTeFknxYdm+T50lnyrxVeG9TSe9zOiLdTsRfIVp9tN9Y6SSBE1LamaY6KoZ/rHxVRnF1axkMQ
 HjJExm+dQ/g13LT/BLIYuRlWEO+wi9Y=
X-Proofpoint-ORIG-GUID: O_cjV9owRSsmuIyQZ4Ya-EJSw7o_f_66
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA3NCBTYWx0ZWRfXy6ZZXVQSttzc
 1tbczMVHBt8IZO+N0p+lHtxviX9bGjDBXKnf6U+JWjbbTJTtL7ZqQ3ChhH5XbzRzR4K6ynSeGWJ
 Zs4D2orTekngM/AxwFcQCCuO2OjqbV65sqIMAzcKw142TR1YVAJRD/5MvyjzpXU6uaV2BuXn+/8
 5aTdGwap3gKgng5LdM0GUB6b/O8m7YgAP4U35dPhzZbEQbLRYzu7/Fmvb1jBVvmlKCVQ9TFTJRf
 uJ1wGiZ22gbg4dP7OU5irCzf+ID1tSAsV2ak3hdFuGBsXFDR3VxilulK3d7qSS3I04CgT++W9BL
 EwjMB5gh0GMfV2A6UgQ9xDAWOd2wAro56JytnOpKE8iV2xea+mdKPQ7PV+0ahy5Vk+31E1Gp5mo
 +Cx7KBr5mP2GDDx14jG60qcm4glvdJ91eK61T3VPugCemiOMR6zAlpM3EMmXlEwqxUR4qBn8W9X
 blxhnWre5LgJkk2sKYw==
X-Authority-Analysis: v=2.4 cv=B+wsQ+tM c=1 sm=1 tr=0 ts=6ab6c087 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=8pm97rweiJCjLsilNG8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250074

Hi Jeff,

On Fri, Sep 25, 2026 at 4:10=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 9/25/2026 6:38 AM, Loic Poulain wrote:
> > Hi Jens, Luiz,
> >
> > On Mon, Sep 21, 2026 at 11:27=E2=80=AFAM Srinivas Kandagatla <srini@ker=
nel.org> wrote:
> >>
> >>
> >> On Thu, 06 Aug 2026 16:38:33 +0200, Loic Poulain wrote:
> >>> On embedded devices, it is common for factory provisioning to store
> >>> device-specific information, such as Ethernet or WiFi MAC addresses,
> >>> in a dedicated area of an eMMC partition. This avoids the need for
> >>> and additional EEPROM/OTP and leverages the persistence of eMMC.
> >>>
> >>> One example is the Arduino UNO-Q, where the WiFi MAC address and the
> >>> Bluetooth Device address are stored in the eMMC Boot1 partition.
> >>>
> >>> [...]
> >>
> >> Applied, thanks!
> >>
> >> [04/10] nvmem: layouts: Support fixed-layout as the nvmem device node =
itself
> >>         commit: 9c6cab93dcd47c3075d896c777567b9d8f813d18
> >
> > If you're happy with the current state, would you mind picking up the
> > block-related and Bluetooth-related patches in the respective trees?
> > They are independent.
> Should I take the following, or someone else?
> [PATCH v10 02/10] dt-bindings: net: wireless: qcom,ath10k: Document NVMEM=
 cells

Yes, it would be great if you could take it. It=E2=80=99s mainly about addi=
ng
the possibility to source a few device-specific values, such as the
MAC address and calibration data, from the NVMEM area, regardless of
the backend, so no dependencies. Moreover, the ath10k driver already
supports those NVMEM cells.

Thanks,
Loic
