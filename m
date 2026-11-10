Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297240;
	b=D1roauv35cbsoX/96elmW5lRPbN4WQ1eo0xLJhxKxzK25SLosVGiaEtt5ryABOeSAH0b
	 GA0xd8JfMVPfnDoVsBwuIchQu7i0k9RHNplkVqyHrbg9ITN167LnmOIWqCOsiLQTDSK19
	 rFHeejpj3tJ3ub6X3l2rIeKR6zCRhP461HAlW7MFjFdyj7EUFhSutKDYSm0EudeSiRqjT
	 Afof1HD+cATrUvDKM9JduyhSYz/V8Ddd+IlcZXyPM3Je/KcxycF54p+tdZj6UW9viq/35
	 q69vsZ3x6c0g8yRVAFpcYsFNZTmlWYsHGkXCUfTXpa3vzMmvRXa6ltBr3V4p4c2xJBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297240;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k40nDh/DlGtTF2XbNI2TG8knC7Im/kFKhYdaLoOlitg=;
	b=Z5t5zUM3Q78fM35K/gDjUQhKjt+Fenr1IPv7EU/vuEBV9jsPcRUqGvNq5DbPT3r8P2gp
	 QmMCQZjsLUR02PcfCFR9FwwyHWqFRxKnODQNHLAnN4T4GBA3TJOsUDEZeBB4Els1dkQwR
	 ad3Mmi8S9oAyOw2MEI/B3JT9w1xQaPxDJ+nd4YMDVTdsHQy/ulPaqQ75cB9+O6hafb7GH
	 R25z0BrgWNDNb5JepZjT7ArsEtpsK1nJWYPwr7etLBrKSTspt0OPpBaMRkL4gGHd6bhq0
	 aBz4Ih5tDFapPiW1WT5HOThb4ODNJGowR3Wh3po/nFipYzhZTd3G7sAftqB04ML/eLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VDj1jSP6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QposB1Qj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A172B606A339
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 07:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A172B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VDj1jSP6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QposB1Qj
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7ko541807700
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 07:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k40nDh/DlGtTF2XbNI2TG8kn
	C7Im/kFKhYdaLoOlitg=; b=VDj1jSP6Kx57MAyoqGynoI6DZIi1eMpV4I3D5PCT
	Y8OrPUOmNfA7IYtea0LpZf0cEdIq0RlZBDmBKI0uyVkPlON6WnPpLYW/xrzd4FLK
	P9L70rL+NplPFkyaccPVHpf/CSQWIv9mLJBoKAZSZeTu9pv3GZFbak1yebUZ1YoD
	vSQziQzMhn0HTPTv/cS/QsGpSllOKPNglnRfW8dlEtvuWEeaquMnmPjjKKOZv1U/
	s4t0/e2SGPTd0hd5PLmafOz6SKBv8mfseWU1PL059TUanlLrqXiLDavzeJJ/HlQA
	TCbmPiqRaY9Jr9jLceGVskvzhMaP/jPpSAUWKGw7SUhhpQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcjc688-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 07:53:58 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14373747468so2169111c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 23:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794297238; x=1794902038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k40nDh/DlGtTF2XbNI2TG8knC7Im/kFKhYdaLoOlitg=;
        b=QposB1QjII3lL3fzvW6h4wIEP+05RkZ4QSU0mdx+ymeq/4PRw6t+oJhe9DJY69ZxfU
         48wtFImqGKLrJvNs39fPvcqYWmVqpWdaKrJWgbbighTYM4nwAxNfaV66yD4KFwCYB5t0
         7jQvDUxMVKy72GIZFVgviE0XItKeUJ/czqqPnlx1Y5WkJqxSzL2czgnoaFliTuldKf72
         Ogxno8iBdGwIlBmXBnCZOUzsHrDktsRGfPkl9QCgsfVUKex+sdeH9KLIg8gk8vOTzhmS
         sp+T/QtLm6zQ1b4r44SeqLC9mxkTDEjIE4kxJ7W5+j2cSFeESjrsgFu58a0P1WWhi0wT
         AEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297238; x=1794902038;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k40nDh/DlGtTF2XbNI2TG8knC7Im/kFKhYdaLoOlitg=;
        b=CWods5rmyc+B8wIp8Phk1QGELxC119yin3ospAkd1BqHHcQtu8SQOaijUZxfId1vuI
         mvkJW/wFqp2u0h2cPQAkx6ou4EFSetCC5eoz8oXnbpEmoT/Ukkq1VbqBVd2BBWxvIFvn
         Ks9l+sFvRcbkJ8jw/EJnXufJZAA0A0NgDTRhj1rsd/OV2FySfMhbBxInZ5Hy+3j/Pe/A
         fdCqBnopcW+7hZo6ktRQwecF8Oc9AbjoXJJe9obe1vb/YZhXD1OaIHPIqJcnVgR2yAgj
         YNPJf0w/a4RdHVjM8iNBg2urBdjLr9OCT3Rvp0TuDCKUpgig9QOTvxq54CZyovtDK5Hw
         0vHA==
X-Forwarded-Encrypted: i=1; AL+hErGoFxkpUnSvelrZN3SUYMVrquGbvu5SS+19mNwtN/Xxqe1Qm7zEj2QirpdhpzsAnR95fIBGW9O76U2EXJ2T@vger.kernel.org
X-Gm-Message-State: APuU4Z/dDBuH+xD0JY+klVhDqM0Xsy2L3HS5/S73n6KBDyp/Gjb8+Btf
	JrVI3WV6j1HOybFADnqSb0jxBCqDbBt2Avb5lVt1lUjI431bbvVWG9pq+owEUBayvrb+4+gBGb6
	4av0l7ti9jzdsjbHJxsCEOl8JcvjmuK+cgETCUhaKJ0nmC33K9UXLh03sIMrq8T5OhW0G
X-Gm-Gg: AYBFou3CyTfxzXxP6Td2jh5PFBlqYJYQB0fTAgIp7gQU+ii9SDljvghalxH/fWxoxsI
	rmc92UMW4rGQixyav1EjzMBrzNCTtdA7Xk9S4jxYXikS0P+ftdJY8/5bpkDJN6pPIGtZtm0tJP1
	sNT5h3O1PkH194AjMhuOX9YWCWpRspy6CMxTzjzDG4LVHIfYmj/+Usp9oY5ffv7HFpBFgV9BrL9
	YBjfgtsMdJ3hFbH8ii48hG/mujaURPsfil3Q46SM1AmKXiEYerOx7NesNXx8owSkYIkHr9hlNih
	icng0QOLl25eAzp299ftNZMbnoIhfDw2OKbCBLdNqIgbljs7vL4hsHIJslEW7HVXDPZgSrshSqb
	v1tFoBEaxKahV+nji0YeCEVMjU8Z9cu0CRbrw/dydebH6shOLmcx9IwuWnJjpfIXNIm9Bu3Nn/y
	c7nia6vazmSV/zIHDW8m/c2w==
X-Received: by 2002:a05:7022:b052:20b0:191:ac4:55a7 with SMTP id a92af1059eb24-1b3b6025b98mr2771614c88.23.1794297238086;
        Mon, 09 Nov 2026 23:53:58 -0800 (PST)
X-Received: by 2002:a05:7022:b052:20b0:191:ac4:55a7 with SMTP id a92af1059eb24-1b3b6025b98mr2771573c88.23.1794297237340;
        Mon, 09 Nov 2026 23:53:57 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11150sm7259850c88.5.2026.11.09.23.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:53:56 -0800 (PST)
Date: Mon, 9 Nov 2026 23:53:53 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Tapas Rana <tapas.rana@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Esteban Urrutia <esteuwu@proton.me>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        prashanth.k@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] phy: qcom: carry live SS-link state without growing
 enum phy_mode
Message-ID: <avLNkT-UPTsFeqsb@hu-petche-lv.qualcomm.com>
References: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
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
In-Reply-To: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
X-Proofpoint-GUID: F3SbWy6VXCw3XANUbYNuaJgUSAxNTm39
X-Proofpoint-ORIG-GUID: F3SbWy6VXCw3XANUbYNuaJgUSAxNTm39
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af2cd96 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=8fdUJlHZo7_b61wjJHwA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzMSBTYWx0ZWRfX6Fx/DBsF/y1+
 dv/avAWYJEVwiH7xC4G2lKOjYN7+E93LBDzbViBQxfdZMdx/T6VuNL49U7bQkpl/vBzSGctlEig
 IBhHzwdM9yfy4bkQFi7k4HycRk72spg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzMSBTYWx0ZWRfXypsdKHqBQNGH
 7I4bi5o/Lnpn39n9DZTiCQ06HtsZS5rEInjNbVQ9mKgLeKwCqU65AYtecBMiXMNf3EVABhQGWXX
 14rgPzGYZ+0bDgDnM0moB8RZJb5IARhTK5ww1lbDsEG4lbkWhS94xJSHJN0lH7BTfcnjhlnptJa
 CuPtYp4xIbQCPwyFqdJUFCNqzpff7xagpvk8w7vjqwz3jNAL+0/mmM+SXFGuq0WaVXUX0PGT4SX
 MHsnBGSQh27uU/iOe09hUCDaoL0YT6a2xRbNXAJW+4D01Rqs26JWIDwyZcN3WtPYZXGuA5WjfNw
 e+9wU6fzFoyz7XxdNbskpNITwuCtZ/vDXZ0HgFFJnJDWwGZksoyT4FITqHPgGGr8Z0Eb2ABcYqT
 TLFe9SEs4Fi26WClyxq7Z9yf6LdDiJbZA3X+Vkw8pXv0SI4K/CVOZI1vyyV8l7eQLVgQVwlnolP
 9tvl1IpTidKHez+wOFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100031

On 26-11-06 13:57:13, Tapas Rana wrote:
> QMP PHY drivers always enable receiver detection (ARCVR_DTCT_EN) in
> autonomous mode, and additionally enable LFPS detection (ALFPS_DTCT_EN)
> when a SuperSpeed link is present; otherwise they fall back to
> receiver-detect event selection (ARCVR_DTCT_EVENT_SEL). This choice is
> made by comparing phy_mode against
> PHY_MODE_USB_HOST_SS/PHY_MODE_USB_DEVICE_SS. However, dwc3 core only
> calls phy_set_mode()/phy_set_mode_ext() with the base
> PHY_MODE_USB_HOST or PHY_MODE_USB_DEVICE, never the _SS/_HS/_FS/_LS
> submodes. As a result, the comparison is always false and the PHY
> always falls back to ARCVR_DTCT_EVENT_SEL, the legacy USB2
> receiver-detect path, regardless of actual link state.
> 
> Add a dedicated qcom_usb_ss_state submode and carry it through the
> generic submode argument phy_set_mode_ext() already defines for this
> purpose, instead of adding more values to the already-overloaded
> phy_mode USB host/device submode list.
> 
> Patch 1 adds the shared enum qcom_usb_ss_state (UNKNOWN/PRESENT/
> ABSENT) as the submode contract. Patch 2 makes
> phy-qcom-qmp-combo.c switch on it instead of on phy_mode. Patch 3
> makes dwc3-qcom.c sample live SuperSpeed child-device presence at
> suspend entry and pass it down.
> 
> The contract is intentionally generic so phy-qcom-qmp-usb.c can adopt
> it the same way for the gadget-side case in a follow-up series,
> without a second mechanism.
> 
> Tested on an x1e80100 CRD. On a host port with a SuperSpeed hub
> attached, suspended the system and then connected a SuperSpeed USB
> pendrive to the hub; confirmed ALFPS_DTCT_EN is set instead of the
> legacy ARCVR_DTCT_EVENT_SEL mask. Repeated the same sequence on the
> USB-OTG capable port with the same result. As a cross-check, repeated
> both suspend scenarios with a High-Speed-only pendrive attached, and
> again with nothing attached, and confirmed the PHY falls back to
> ARCVR_DTCT_EVENT_SEL in both cases, as expected when no SuperSpeed
> device is present.
> 
> This series spans both the generic PHY framework tree and the USB/DWC3
> tree: patch 1 adds a new header, patch 2 depends on patch 1 and touches
> drivers/phy/qualcomm/, patch 3 depends on patches 1-2 and touches
> drivers/usb/dwc3/. All three should be merged in order and ideally
> through the same tree (or with an immutable branch) to avoid a window
> where dwc3-qcom.c references a submode phy-qcom-qmp-combo.c doesn't
> yet switch on. ARM/QUALCOMM MAILING LIST (linux-arm-msm@vger.kernel.org)
> is Cc'd on all three patches since it covers both directories.
> 

Is it really we need to do such complicated, why not just call phy_set_mode
before suspend according to existed downstream port speed under root hub,
it is normal requirement to finalize PHY setting according to connection speed.

Peter


> Tapas Rana (3):
>   phy: qcom-qmp-usb-ss: add shared SS-link-state submode contract
>   phy: qcom: qmp-combo: Select LFPS detect only when SS link is
>     confirmed present
>   usb: dwc3: qcom: pass live SS-link state into PHY at suspend entry
> 
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 27 +++++++++++++++--
>  drivers/usb/dwc3/dwc3-qcom.c              | 36 ++++++++++++++++++++++-
>  include/linux/phy/phy-qcom-qmp-usb-ss.h   | 17 +++++++++++
>  3 files changed, 76 insertions(+), 4 deletions(-)
>  create mode 100644 include/linux/phy/phy-qcom-qmp-usb-ss.h
> 
> -- 
> 2.43.0
> 
> 

-- 

Thanks,
Peter Chen
