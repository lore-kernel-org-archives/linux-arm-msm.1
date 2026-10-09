Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B4E4E7809
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 14:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791557012; cv=pass; b=iuwDdi8kpFltXj+2APF5utqKkeFFElC5IwQJBA9noQwKYQDr8CBHixog6d+GZpZHKcoXdbgKIkM2kimgN7Y+jnoCKL2QGG26sB+0O2LccKTv44/ZjrL4HnILWTtMY+6lzzAXWCWe0vKZJ8dbz/zdhMXaipQ7qSrbKNc0S4ceWEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791557012; c=relaxed/simple;
	bh=5U7XqM0iYXBdDlJihKxhkWeps6uHFjeVxdyfKfJZthQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzoK4AhD+2nEzRMnzfnX4DXGUkHkieqFh9ICfktkbAiMesvqigGymah+ge0YmlNh4L5xnnSdSYbcJneqMn2SJ6ydZtwLvy1KmxTWaxvnTBDzbbL/5qvTKUwJAbPh0hDWGiU/RvV3G8vrDYCU/zf5vBF8Sx/EvGT9VQ702rOxFSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OucXmOv8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ciw6hc9e; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OucXmOv8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ciw6hc9e"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DK4181754473
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 14:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MFR2AOl4yda5AptAjwSQat1eKBRcF12cEmBSADWeyns=; b=OucXmOv8QLOr2EQt
	RI+eChZ5BICG4gv1ayGqO7u8MoiGZTMrZgMQ6JYdSwkUl+pkidf1YD2NGfYKhgNX
	egvb1RRlmAIGyoc2U9vUnXrOlYrRy2wHBtSi3zdo2rJ2RzzOFQyeee8EFAeUgss0
	tOe0vjrletI0qD7TPDccY4BfYYsorOtfdC524/xN919n3Iy6FpyQ3JXbscviIiEN
	lk0QtWtE575fJRD8XtywnfK0SUxxgqG78GtP2cv3vBHQx6YLfLtA5rFoQXkljXVX
	CLNZ1C1i3qJSthYN6CXIMd4IbbB3pCNrwpbfo2GceUEPA84JEvxMKUvxsD7s5awB
	bfR5Qw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6x6wgy3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 14:43:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5339732335dso87885391cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 07:43:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791557009; cv=none;
        d=google.com; s=arc-20260327;
        b=bYIrksI/NZM40KiSbamZkrMoru5lDv4s+a6eLG0meGmCfsyE5NDoqaqAbrE4/Unr0r
         /HK4MDwxpn73dFMEKLD7/gyoBs5BxOxWqIeEtk6X6NWz2iseqAek47+lX3C+2hXXRW6B
         XE5/rbyFpP+0XLdvYb8rhj5YLHFdIGe2JBJ6DKbprrffLthXmjiS/PInI9BobK37U9UY
         ezDbCJm3aMjyyrXqCb1WPaC/oZpGxCQPJr4uPI6VGshZaSwRzV8veD3DtYuVBg9Nk2cP
         oZizcNbzJ++8OR2KV/xIbfMzk9SuBorSAyR2qhmF6a7//oSct2rypYWwY9PALGqsor2J
         SpOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MFR2AOl4yda5AptAjwSQat1eKBRcF12cEmBSADWeyns=;
        fh=SKSQlhFqpPjBLMmxoukzq2klMTDc8fhb5FBiWCn4/dA=;
        b=dML3CUHZ1IskPJ30eeEAOfmOThPmNBpNNx1U0DveLTK9G5wRfIX5a2mRg+bq/z7Q9k
         hs+qeYZvOX53J4+dCifgoOD6YogtxcabngmEpLb8YpWuO4X/CukkthuICq+RK0G4Qix4
         birl3J/x/N6APK6zDD5jb64b840yeejdUzT5Dor8GpQfvo6Kane1ylxFpzeZhx3nV3g0
         sy3pIUulnHXmWoMmAGIQv4uEi1QRZqjRghqIINRruGSQYYsd34tWV63Xmc6WUU/cdbQf
         Z0rkDulIejB7SqyCXzvk/ve3gpWo3EWZXBAQ3RS1rVLVcpqmdR+lCMpfGngA3cIcWFiE
         t8Xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791557009; x=1792161809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MFR2AOl4yda5AptAjwSQat1eKBRcF12cEmBSADWeyns=;
        b=Ciw6hc9e7jVP0tV0wOENeAOL6tPpqiFEusceiMCB+mzZ7eiWkPxY0ngaqdTJr0vLms
         yFTPsEVRF0ksygC0a1PJRQr3GhIjMfFzOKi7y/TVwyrp2xPn8/JKKuuLawYZxe7EVCtJ
         4zScA9aWavjyImUGDod3Rw0pWACJC1vmOa9+mWDddDpoaxrQwH0ZM5PZKUZFtY5wIb4O
         f5srld3UFdKH2zFgyH3A1PyPfJJw0lMqwtEKTzulcUGK07EvT7AJfp9VC7NCJJrVyziv
         iZ4cZfX0wF3qZa4qxBb7RICPJFC8buqc85a1Dgz1vHD5lkqOWPG7RLu1a41PwHnPMJAZ
         3SFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791557009; x=1792161809;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFR2AOl4yda5AptAjwSQat1eKBRcF12cEmBSADWeyns=;
        b=NgTMnKY6z0n9aR25xUjxJbyM6lmmOB4eh8H52SEVetH1gcWS827XZCqT8suYTseOCL
         dfo6VmC0Uoe+O/F+/6QpwpQXjmwTpxQaOwPy+od5ky9q116rf5P0FoWYX1PUzDT7EFeN
         xKGdlpd6U/jedUFHtaoG/UAn3xRjflrRzlmt21k5vRSpe/WzRwv0uKIjj97F73awvOc3
         O7tSne7f3B5cH28K90oj4imz6tFIJxftizuI7py13ocmWUTfTcUD7qLCMn3Vh5C9B17d
         M6OjTCqDi6kiWMwc/vT0ZSjiaMsBPAZCO8w/yG1yBrij2weRkK95XVUP+QZesB1WHoAl
         c59A==
X-Forwarded-Encrypted: i=1; AKwUvBywaiHwdUp4ZXqzxFwZKkOOOLWz9wywfFN8jnkRnhFJHgS8YE3M2tJZIjpoEX7szA/zh0HCDmQgSZykAqu3@vger.kernel.org
X-Gm-Message-State: AFuF++nGRASx6B/PPvJO1AzukEeyRqMUsb7ZXKbaEeUYrWC2T92IonZ9
	OOx0zY4FERf1pEBsrWkFx/n9nfdaKYmQaj75FAYNlV/y/kFeVicsLQK/yGGEspW0PkW+9qkxqKI
	mbVuBbLyOijHdmEjJdSjhOk20Ddjse/fGsrsrmudu7oifGEvxLywAFYpnd3JeHftBH9ERUDDhL7
	GU0ZQueP2UWk37YB1MkNSae1CtxhSGtYQQxUQmbNGRFQ0=
X-Gm-Gg: AYBFou0pjKBh9Xua325k2tAP33wIhB2VOFlssSH9nmPLS4B5fJy+1ZwDwZN9ol8+9Nm
	U+U+mDXIM2n8wJrgvK/3rNaXN/Oi3/XR/HGQV+Skyda6TMrwAMmUVX77+P/FeYCArRDj+bLggDC
	DZkHIvLpNkuzwDX9hcF/xJVZyOQKRnPhCclFjCwOM2/+8Shtlbj+SPgmM=
X-Received: by 2002:a05:622a:2517:b0:533:73b3:ab37 with SMTP id d75a77b69052e-5359facd277mr32613961cf.21.1791557008967;
        Fri, 09 Oct 2026 07:43:28 -0700 (PDT)
X-Received: by 2002:a05:622a:2517:b0:533:73b3:ab37 with SMTP id
 d75a77b69052e-5359facd277mr32613541cf.21.1791557008361; Fri, 09 Oct 2026
 07:43:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-7-72f222e23ec1@oss.qualcomm.com>
 <CAGgiveU+8d-MmPL4n_ADimkrthsE1sU4QHJoBeh==sxLZmdrFw@mail.gmail.com> <f9e91a7d-1628-4746-b2e7-03c7b1be11cc@oss.qualcomm.com>
In-Reply-To: <f9e91a7d-1628-4746-b2e7-03c7b1be11cc@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:43:17 +0200
X-Gm-Features: AclHuK-iwpXhKCW1lDKHLFQjYfiUaQQVp7wnVNfe_r5bhgAvlRHOCGBGjBCgB9Y
Message-ID: <CAGgiveU0DcUYW-EF-hneNqeQOkk9OTwcvzhgUvFB4JJOGSiwkg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 7/8] tee: optee: bind RPMI services and negotiate
 backend capabilities
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfXyQDug07CN4DL
 T1HtMlY6/e/e31znVYiP+/KZjxcrdtbbWHcx53OvkZkoWwrNJ9pGfyah5sDdIyGWvzq3rNYkeCX
 XCLhvOE35TxGu2+Iz83gY3L6wwLb/lk=
X-Proofpoint-ORIG-GUID: 0K3LnVpDbjHZJVvrg8pHrDCuG8o_jh67
X-Proofpoint-GUID: 0K3LnVpDbjHZJVvrg8pHrDCuG8o_jh67
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX0r2FnmskITLV
 Dr+yLuqZIOU+PVwhK/+mBY6kXlYI1F32rG6wTUTHzKBt1i1julrTYpUmayrj3c/e66JmkcTmyqS
 SeL00N/NTzjGwc5DgqTUmWUsTuGNumx+ZVdqY2hsXAt+eHg11WCnhyQLY8jmxKcjRK00dlznHRS
 VQk8BQo1+WlTnc26G4261W4tz18fsypnGisAfNExJBMNMW6Ok1DWUPyStQYuajo2O/6bq9hAgEV
 1lEl5nVRTVUQiFwxTdMtjKqJ8u19+Z3cIPxuPKEZogkT0r8HOPwAYatkbCvQdsXU0IpBStfGctF
 uUVEnyGA4tYgUIpyEBL61Q3eCzl1uveuKRf5mbbc9Wxg8rqQSYk8e/U40INlHrtfesQOuE/AUKk
 w26DnYR8OSEemIQRNK2Dh61VCK3bfKFpoqq/8eOsQTkjWiowO5Ezuv9wXtwBslaXCdfz/S/yPO7
 nAsjY+FdzjbidyOYxfQ==
X-Authority-Analysis: v=2.4 cv=ad30Dhot c=1 sm=1 tr=0 ts=6ac8fd91 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=9OYd7h5rvP6jySxxyU8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090058

Hi Amir,

On Fri, Oct 9, 2026 at 1:10=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Hi jens,
>
> On 10/8/2026 7:20 PM, Jens Wiklander wrote:
> > Hi Amir,
> >
> > On Tue, Oct 6, 2026 at 2:40=E2=80=AFAM Amirreza Zarrabi
> > <amirreza.zarrabi@oss.qualcomm.com> wrote:
> >>
> >> Register an RPMI service driver matching the OP-TEE service UUID and
> >> integrate it with OP-TEE module initialization and removal.
> >>
> >> Check the service API version, query the trusted OS revision, and
> >> obtain the RPC parameter and logical notification counts. Initialize
> >> shared-memory tracking, the call queue, supplicant state and internal
> >> context before publishing the client and supplicant TEE devices.
> >>
> >> Connect the RPMI backend to the common OP-TEE operations and enumerate
> >> trusted application devices. Enable in-kernel RPMB routing when the
> >> RPMB subsystem is reachable.
> >>
> >> Add removal and probe failure cleanup for the backend resources.
> >>
> >> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> >> ---
[snip]
> >> +
> >> +/* Query and store secure-world capabilities and buffer limits. */
> >> +static int optee_rpmi_exchange_caps(struct optee *optee)
> >> +{
> >> +       struct optee_rpmi_probe_req req =3D {
> >> +               .op =3D cpu_to_le32(OPTEE_RPMI_EXCHANGE_CAPABILITIES),
> >> +       };
> >> +       struct optee_rpmi_caps_resp caps;
> >> +       u32 rpc_count, sec_caps, notif_count;
> >> +       int ret;
> >> +
> >> +       ret =3D optee_rpmi_call(optee, &req, sizeof(req), &caps, sizeo=
f(caps));
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       sec_caps =3D get_unaligned_le32(&caps.secure_caps);
> >> +       rpc_count =3D get_unaligned_le32(&caps.rpc_param_count);
> >> +       notif_count =3D get_unaligned_le32(&caps.notification_count);
> >> +       if (!notif_count || !rpc_count)
> >> +               return -EPROTO;
> >> +
> >> +       optee->rpc_param_count =3D rpc_count;
> >> +       optee->rpmi.sec_caps =3D sec_caps;
> >> +       optee->rpmi.notification_count =3D notif_count;
> >> +       optee->in_kernel_rpmb_routing =3D IS_REACHABLE(CONFIG_RPMB);
> >
> > What if OP-TEE is built without RPMB support?
> >
>
> I discussed this with Sumit, and the intention was to make RPMB probing
> part of the baseline for the new ABI rather than negotiate it separately.
> I can enable the capability bit if it should remain optional.

You have a point. Let's keep it, but we may want to move the
assignment down into optee_rpmi_probe(), as the other probe functions
have it.

Cheers,
Jens
