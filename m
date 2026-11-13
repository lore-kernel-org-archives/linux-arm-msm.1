Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794575676;
	b=L20gq0Eqi51u1xPtsrYDA1hQGJw71vzVlfci1bRdgXwM0izicLBAUwGgNc5U27OC8FXM
	 TMNU4J4ngtBKGJyXgII1HGcPOSmY0M/+pmJb+zvKoNXbJERJwESJk8xfoSGEC2HCYfh1e
	 JKO3OYqEL+krhUSMXXJVTfp6tEuNk8oBYnJ4TjkSRtPLNX4cgNNjWSQXYQS3BD3Np6egF
	 y9EAM7JsDm1+3lD3Z1pIE5hxohTCPmdC1/rr41im9iFdz1Ua444H/qwbUwyZmtpOhXhyX
	 d/fDOinP9+XizjsBDrUZvS1qjFTUqdzm++f/vke9dh6W4l2dUEzKsOta53eKNzd7RiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jyq0CHFpuFmFNoRbVotKqEcNN2VMoPGS7s9L+aqOXM4=;
	b=RG6FNgK0EM7i95esRwW12F9aTUMYrCEpPR0AQbxVCrTlRh98FXs3C07ZQdo+NH6ehdfr
	 XcJ6iRY4Nfh7RSqakzvSiRjssh90NyKBRR85eafUeTYKaelY2p2vSaGwY3WbHkcTFvLgw
	 V9WMdcxHrZ3nJ4zi1z0p62wngm0a4ynTCMEdkiUM9/Qj0FfS64sTXxztXkczNAaNMVSsG
	 l08rXBBiHJoEOyM54OBSrCWL7JVEGQ5kYnqeXavndvyRZaBWgPk/1FM26wzv4+m1pNgHm
	 fWZtdog6yimw5I5dLAkenSJ/2+WoAKAU1TNdCuENK+WERcyfH/xXpcYmeSYBw9pir5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hXUGRL4y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OUfdZhpZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDACC606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDACC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hXUGRL4y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OUfdZhpZ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJcTQ242716
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jyq0CHFpuFmFNoRbVotKqEcNN2VMoPGS7s9L+aqOXM4=; b=hXUGRL4yHi00dJim
	M25dk6Dz2Sx28JEYAIfIC89lLjEMl09eKnBGb3dStt55GUkm6DY/ppMLhXV61X7g
	IbPQoDpwCNdD0Xwq+UPXPFLgt+NQXSg4zeLjPPyhon93RLbLSwGsTDQ5oDUwwwBf
	acYRDQ1x3Ss6ukHMzrWf3csw9HeFECM3u4e8BxcdynnTmCVnpmqbUg5PLK8l1fud
	fkNdr10V/zYZnLIEPQysW+ApCS9J+Ua4/NjMJe73UuGJa4rK4pEXt8ZFX0jShDYk
	J0YrM9zaEEuORdgU9FKOQ8NbfzZHkM4nZx4NQuqs6j2DkhuD++kXM3BwyAzCYX0f
	d+Klxw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37hmwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:14:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so1782839a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:14:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794575674; cv=none;
        d=google.com; s=arc-20260327;
        b=lixgNN5jy5o/QIYh+mC9lAHxpRSsgGbpDRorEi1hveFNvj4fEwGewDVC6U2uxRoHxa
         iTNaFVRVeJoYsDWkuxScLu71qbs2E920BLKu//4ISdaFBE4FYbH8/bUpDAT7JTcw1OWA
         FrNJiao9LswEK6IWm+EkLLFY7RtDBzuQAyps13cXeKZFEAGy+Nc0i4MyUBUmkjiBNruT
         1DrJeAFDesG6ZMauiXRhPwWuwjTb/GFgNA9zKyY0kewglDwLgnGdCcIRNNWElCri0Vkd
         6wNsI55D8XHdwYMrDa2pQo+rHJ19/9S/ogSZwkMN/dDYkJFDJhEvKw/RilVrLILDh5Ni
         dByQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jyq0CHFpuFmFNoRbVotKqEcNN2VMoPGS7s9L+aqOXM4=;
        fh=NRhy78dzkOISW7FrftdbeOjR55haHTn0DU4D3K43iXk=;
        b=WvgSjuY9ou+tlTug3LzWhdxVMKMuM+lwBlQOuOpNgvRw9we1w3gkbYmNCjq35Bj6Ws
         OqqJRAFN6E7TVPeD4LxBscUdo7ZNm3XU43aKrABkrgTQ7jj+wXbtMe0QrHbD+zPhAYWg
         zr1kkOmz+NKxp0fjqYliMysWvgBeHf1w7vvQudd+e8YZavAiCmmGAA8BElPO9SoTFGwl
         MjmjYyqYPSatyRvkzITTfFxVYzj167HiWYajO8bEVR4nZS4/7gYnaZEl8uQ6FZX3UKvl
         hHMG8cDlNoKAdSQhAoxf8gbdM063hZwWozGn4fvmpMC1l7188xmGqHQ5lBLGFy69+hV0
         FD0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794575674; x=1795180474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jyq0CHFpuFmFNoRbVotKqEcNN2VMoPGS7s9L+aqOXM4=;
        b=OUfdZhpZwliFBfR5ez5O5FvpneaurAsXoS0SkZMWHteOMDJ50kdEpX//EJ/hVgPdgY
         9bIbIC6UMCzPjrA7nKDC0kQ2//OKDomwYfVGOdtdaHzP/Pum3u5F8lbx2o8ZfHMN9v4a
         /LG0fizSbxJRCZHLv8a0ZtnCpryVT3gQqge1Ozu0qWhplcg26OvjKjzSSgpkNraOXBgc
         WWXNCJB1QL3M5g/Wra+5XS6Gjf37XIaLxSTpETll+yVay5PoQ+HlZQqFSnR+EDAGIOQE
         VVMI82mgZSkda/XYYcgBanvOJsPL3ZgGFVtvi+ia5rc/i1kXjLLa79c2RinQKE6Y7n5f
         cenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575674; x=1795180474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jyq0CHFpuFmFNoRbVotKqEcNN2VMoPGS7s9L+aqOXM4=;
        b=BAh8sy5BL8RJ1p2AQyzaol+N/gEj8O8dnZRyrnzxqzpJrvTCjdFHGHp5kA2RgcDj50
         kFP1OGRhH9rO2Dxi3pE3fbAIecQk7UG/onfNv1M7jABYU+3LFVaOsd//LNlc5K6YNF7W
         1lM+vpPImwvv0hFeYsjijdtNuySvIRgA5MOdB/HgvqAx/egXt56F+w45Agm9cxV3Zp4k
         wtmrfPCrDIr2qBZjEaT7vbOPLOMnCXIx1XaEb2M7L+i7b4mYYS6KmPP4yAHB6aY6Ttkl
         Lp7LW1GCK+Sd+Y2B24qB6YVhOo9KqHMMPKKBPRgs59uK/8PUWVXywTj8zL/2wuaYhXDz
         g1og==
X-Forwarded-Encrypted: i=1; AL+hErHjA0UUocnapCQtSv0bNuf5lIWv4DIGPZ1QPc9RGTXEH31/EGduWYNXju/fxOzUPUpgaV9UDuX0lA4r43NW@vger.kernel.org
X-Gm-Message-State: APuU4Z+rzp192adDJ9v5jha0uq+MLxlbsNsD1JxkYqCSgqyUW/ACxf3D
	9Z2UomlsjvIrNrFF6hqW7D64xdYSqmWPLk1zFAP5M5F9vNXQQWxUc3wnVkbvHZSUulTE3tvXJt/
	si7FT9qG33NJygL3czgIoqJg+Ax7bMlrpp8rXFmIkj84Epmjd7NBdH/wvp8CXpyYpFPe9/degqK
	/x2Qf5zCgiLSvaLxJP9/Q/WgCSCCJXCTFePXXMHGZVKEg=
X-Gm-Gg: AYBFou0b0DIaqeF2gts0yNr8b4oUUObyhvwo6l9G4Nd16++9odOXNqbNU572+jaA7ig
	9EdkpmUYdzsSQbgA0ROxA8iW1lt+UEi5A7hipiiTXC/S56nPZ7vWFC0yJU1xIeK0DZy+kju1iPh
	N4bmgT/a1LEHj0ec//vROv670o4dFXx4aPC2ttm0oILnQAeXM/Hs/DlywMFA==
X-Received: by 2002:a17:90b:4c8e:b0:3b0:d808:a991 with SMTP id 98e67ed59e1d1-3b1b0d3420fmr2545479a91.55.1794575673653;
        Fri, 13 Nov 2026 05:14:33 -0800 (PST)
X-Received: by 2002:a17:90b:4c8e:b0:3b0:d808:a991 with SMTP id
 98e67ed59e1d1-3b1b0d3420fmr2545420a91.55.1794575673121; Fri, 13 Nov 2026
 05:14:33 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com> <20261022-psci-fix-v3-2-9ce2133c5659@gmail.com>
In-Reply-To: <20261022-psci-fix-v3-2-9ce2133c5659@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:14:21 +0100
X-Gm-Features: AclHuK_DTsDuBkxo1YAzBq_C8oLcltIpHJD3FMGKMO-2WiG84I3huHHxGsWxuKE
Message-ID: <CAPx+jO-qPAuOGnGfCyGnSYym8PBOaqUJptZh8duYJKZN4HARaw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] cpuidle: psci: Allow skipping the suspend mode switch
To: Reza Kurniawan <imkyufie@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Val Packett <val@packett.cool>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfXz//n51CtJUYG
 Oh134s7ogYC0KbydwvObeIW4VOXMr2lyImXYHlJIV4Yp7cO1WWmXbHo3ObjnEqRJN4SXR77f9BW
 JtS2FCfFHrChmRAkWuyel7tVaoKTPig=
X-Proofpoint-ORIG-GUID: RVS5OgLmYeqNyViG3nAbkMIhNLHwNd5-
X-Proofpoint-GUID: RVS5OgLmYeqNyViG3nAbkMIhNLHwNd5-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MiBTYWx0ZWRfXyIm0UoWmnYmF
 atf6x2e7eGsgSzXMRQe818gtE0IQI+9abqsJ5hZ0TVF8Z4MjdV+rVHP4JrWj5ZMjdxIaKYNloCL
 iB0ZfA31gFrbe92V2Yn5mthSIsn+ceXp1R8wBPSMVguhlTgcg/Y3/liFiF/uQW4hv1dj7TkcRAK
 HXlKW5CDSoSTdI3+Pt9WzK5ivIAT8kAmtlKkA+dApwrElLoxRg+i96Ozp4PM2kHRjdE9/MaGUVy
 2oiC5vgBA3GN4+lbiJVO8qveaNGV4X2XxbRptsYHGDMkaFk25UIcuqOCgXWfChSiNU+YqXdjTAU
 aXRQYFbnPY48Jr9mnMXhHnisB+eOw0wOmujjLHgYAULnN6qujDK3Hh4l0pxuSRt/QdtG5nsDWuh
 x/jC0UcwsAcFcWLeJa/IO93CmpcHa3dB0PocpiX4a3IJfjO13KhQoc6YLv24WYbRF+JIfPEi7Pw
 gieRTzoQH11mNecujzA==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af70d3a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=UY4Qpe7uAAAA:8
 a=Bs3vFoulODVTn7UWAnkA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=Dz9CbhmWzz49oM4s8yQO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130052

On Thu, Oct 22, 2026 at 11:41=E2=80=AFAM Reza Kurniawan <imkyufie@gmail.com=
> wrote:
>
> From: Alejandro Tafalla <atafalla@dnyon.com>
>
> On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI reports that OSI
> mode is supported but rejects any PSCI_SET_SUSPEND_MODE call with
> NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and the
> probe is aborted:
>
>   psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
>   with error -95
>
> Add support for the "skip-suspend-mode-switch" property. When present,
> do not call psci_set_osi_mode() and continue with the topology that was
> already built.
>
> Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> [Reza Kurniawan: split out the patch, added log message for skip case, re=
named
>  the property, added property check at PSCI initialization]
> Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---
>  drivers/cpuidle/cpuidle-psci-domain.c | 16 ++++++++++------
>  drivers/firmware/psci/psci.c          |  6 ++++--
>  2 files changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpui=
dle-psci-domain.c
> index 5722365b94..cc9f14769b 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -159,13 +159,17 @@ static int psci_cpuidle_domain_probe(struct platfor=
m_device *pdev)
>         if (ret)
>                 goto remove_pd;
>
> -       /* let's try to enable OSI. */
> -       ret =3D psci_set_osi_mode(use_osi);
> -       if (ret)
> -               goto remove_pd;
> +       if (of_property_read_bool(np, "skip-suspend-mode-switch")) {

Rather than reading this property here and in the psci fw driver, I
suggest we just do this in the fw driver.

In other words, let's make psci_set_osi_mode() to succeed when
"skip-suspend-mode-switch" is set.

> +               pr_info("Initialized CPU PM domain topology, keeping firm=
ware-set mode\n");
> +       } else {
> +               ret =3D psci_set_osi_mode(use_osi);
> +               if (ret)
> +                       goto remove_pd;
> +
> +               pr_info("Initialized CPU PM domain topology using %s mode=
\n",
> +                       use_osi ? "OSI" : "PC");
> +       }
>
> -       pr_info("Initialized CPU PM domain topology using %s mode\n",
> -               use_osi ? "OSI" : "PC");
>         return 0;
>
>  remove_pd:
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index e73bae6cb2..3226af6d89 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -791,8 +791,10 @@ static int __init psci_1_0_init(const struct device_=
node *np)
>         if (psci_has_osi_support()) {
>                 pr_info("OSI mode supported.\n");
>
> -               /* Default to PC mode. */
> -               psci_set_osi_mode(false);
> +               if (!of_property_read_bool(np, "skip-suspend-mode-switch"=
)) {
> +                       /* Default to PC mode. */
> +                       psci_set_osi_mode(false);
> +               }
>         }
>
>         return 0;
>
> --
> 2.56.0
>

Kind regards
Uffe
