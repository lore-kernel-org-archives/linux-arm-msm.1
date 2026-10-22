Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792697903;
	b=zoW4tlONMx4ksZ1zojw1wkN+AdkOITOjJKaAjm+OKHhDr8y/rlB69f/gCbTIPBDYlTIj
	 vi8KGMfnFb5UTdncqo4Y2a/x5HkifKrq/qfVhIPL0yobef9UwKL5oYoHEHGO2ihRdGVXb
	 aUVUZ6iPB1iZnUClamX1XDDorGei2pXXNwTr3WepGlxDQQrR25rOr8RL431ZuwVz9t6mJ
	 Nat/AxyvCsLgpbtOn5mfvObOWliGPl/+8OD2OcOv/SyJlOx7CuzQhyfGrLbKLA9Af9pye
	 asqvrZT8XNCOW3H3JJOo/zroLPJzmjZAYT4SfXbiKIIdcbY6Y6t6gfrO4pakxAnTspA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697903;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dt/bdjqHlPNBH58AQVAdoaHpPHuiz9/xzEYV3zXl6U4=;
	b=A2gvywqeGHMsSf4IQvlXBhglJtrvwa1Yi4JX/KjgsXL+RDxf9fhaSvAoyiT9CN3aWhPf
	 v/f+btP4pSNyXl8jcWoPL98tjBob5ThY/QFHx9XSMt7xVgCVhg2AmuOpES2YlC34Rla7L
	 7TlRQ3ppEl8iHEoZb5dmzRT9UYbhwcD+YQFhP8w3REuwItLkU9E35RRRaTdr97KJecVFr
	 aDPwUxl97bKaph/R9X7Dheip47i1ypeAqpG5mdDBCPW9PLX44KLwHDzWg3FJ6RxB05PNY
	 ugw/tvVWI+xi7Zso8Fni4QiXU/GLUNuzKozYWkXDkvSpTim1eOy49aLeuuXORRPRjyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=esaUbQa7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dh3lxGbO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D39B606A33B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 19:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D39B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=esaUbQa7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dh3lxGbO
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MHtVdH3078101
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 19:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=dt/bdjqHlPNBH58AQVAdoaHpPHuiz9/xzEYV3zXl6U4=; b=es
	aUbQa7SYKipjzavHOhhtKzNNpPlAQz4xTmckVL+SayRudtiwWxtE2QdOoMBcTyv+
	V0zjxI8pYdmukxE28AWYLfoYznf0x0jdAmvkKL4SL36vMhZFYbgdqGfxAukpbg/h
	xz01RmMYYJiLT6ofRg4LKumx7D5qX2reIp+jnpj79Az3pxob4A+TeFfpOcKY14kn
	U9/nOd78sM88MT17ep2c4xnrm/63cVdRBqX5OC9pKbMBuz9LvUXTo7Q3h3fQNqbx
	PtqbxoNMABQvLX35ErcFfZ4riXUyu8w0GrSAHad+SqgX0kWkhf+2x+0YZVsjyhGb
	MJgFN6jttQa2mbeQYb+w==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93an7nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 19:38:21 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-702e606a3abso146077eaf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 12:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792697901; cv=none;
        d=google.com; s=arc-20260327;
        b=bZ8x73f5X/HbpFq7B3q7lFEHkYd5vtfKQJOUTT4rEC2a9pu0dILPjPQyZr5CbRD4fm
         9661p/DKjShBkb270yOWcvaFGw4EPkb8ijLJwPj/6wEz4ftpt+VO2tj/Zn8eSdVDGWIS
         4Esdy1RP2qMWFiH8txU0H/fSE/iiTsBw83lAJTGaSqvyaVEjovLUA0/idq+F0kkkp31o
         gDXeRw4GH0zEA4xkaeMKUQJuSuNulSVTZUMFg1nQDb4seTjJPTyetXUdkqNvaQXxN7Di
         vwAmaXAzO/7hZ2gxLg5/hfgDIptAQwokA3/z0kJWjl30bwMZ/KlSRWy9ZQHY2ZpCspaf
         HvGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=dt/bdjqHlPNBH58AQVAdoaHpPHuiz9/xzEYV3zXl6U4=;
        fh=GxKgeSj6ETnhnjXAJa6obCWdjl8C7TEQ23Sdh3n2hBY=;
        b=Qd2MdtwduSRLxasJOHO+zihUV93U7svF2lTPkm3uduK+JmxP8QVdGXxDni8soKx3Ge
         goifWW+5QNYb5xk2jSK7iU7zuEXGVNv3iOdaHLrCO5tCZoElQbbFMgitQus+fVEYXKvc
         0eUhXDAEs10oa1yfilSdadtxgEnZyt77R6RB8FtqVFQy0HkcgLHBNPMe6qpRlTQl0FQp
         e+XWXJ8jCDcmPjiOK0lDB0q8CWu3kayo80c2xNDI8uMcnylcgYNgD3hk4fZ+pojS/umM
         fqAEobpIpI2SWFvQWFTngbIEXJclKet4VJBROXCXnTd7ALW+xbJctcN55uQe1OE1olgj
         cifA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792697901; x=1793302701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dt/bdjqHlPNBH58AQVAdoaHpPHuiz9/xzEYV3zXl6U4=;
        b=dh3lxGbO1dghKejnlHZeW3/WRe464CIyq+ABvXlqF9FtobzLfBDIalWNopG7ULK+LE
         bm4WV7WxJc/vZNT8O2/H+lbrj6lVAQXiV026WPUSTehLets1vT4/6U/9Q40D1n2+2H3c
         9pL6bSAaPd03eX4ROOMlCSL1nkk4vqANbykpHblvYnmZAKshN78b54dRBrEL1ctq5/gm
         rjudrSKyToN8l1f6LkY2B39asqcRcLYB5tiA1VOyRPVuj8T27gp4enDN6E72orCzPdA4
         V3TltKgBjrGFf0+q6XqULBH0IwiIL2JPjR4TZotkRmChbK1hyzRO2ENxA+8RN1Loa0bq
         oP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697901; x=1793302701;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dt/bdjqHlPNBH58AQVAdoaHpPHuiz9/xzEYV3zXl6U4=;
        b=wvDwMeKLmvooguu9P//SAV2gDrFN50wrvMbPjwMihSzfNDdTry2z0vp/4Epmw+NAug
         FNEbsn0/E9Co8CAI4kCoYC0rbf3IpM0D3ZG/BcNE9ZkS0eLVNXeiLt/LTFgTTT2s5KBD
         Aa8FtEHwXDD5UvGGkCqBIfJlJhjSQqoDdRKJqbcVjBwhFU9aYnHQvrocI0list55GW+y
         TLE1fpX82AFtNp7AxFWFW6xx5jZljDw+xowhAK9U1rWKGtYQZgTKDCFK5DCeD4+nf+yR
         HzyDoUw2WMeOkTBz4CBRLmgbf3Z4hiaE04fOyU5b2hmPi3h+V40R+wlLN+jogDvv9XfK
         zQVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsHFVF50qmN99tktkly2Q+xFnf1YEKJzWr2xvAQ4YfUQnouDdA8kcxEJsiSfbFzlrcw2NVqXjF8H/1DKxH@vger.kernel.org
X-Gm-Message-State: AFq9FYIANXgZEvgLN4AwzAY8ytjwGNsp16Khz1HIPAbzWBb1zz2uiwAC
	YW77s93MRyQweqIWqTw2bKOwdoSs/f8XGVh9jGak+gVyOvi7RSJgsu4rFbdNvrEbRqOoVTrNuFO
	VC+LCQEL9ofwL/zfm07H44+pVIPmoUC8m63yp5IuZKZdZRBuSltTbPnenHoHXwXQkUOCnypoopI
	264Puaq04TMeX/oJwD99rfrYSYRpI4S47xrfr3TAwFuOg=
X-Gm-Gg: AYBFou2iAHt+f6TfWWS4VY1zsQrEaqIdpInZew5Imf49jYmL1D1Vk17rB0dVRUZ8wfV
	VGtkc/iWi9g17Nt8nlESJeTSypVU0SuLQGrVyuggBsPXPHyz2jGEC3uEdpRg4oSTMf3b2oUDqvu
	I5vmUr1JD4cqKOPlpofm/JhfIGapZ7f0zYhGcKuUB3jPzmjChEbqGhYDTXtA==
X-Received: by 2002:a05:6820:1381:b0:707:7495:9458 with SMTP id 006d021491bc7-70b889a0262mr296312eaf.16.1792697900888;
        Thu, 22 Oct 2026 12:38:20 -0700 (PDT)
X-Received: by 2002:a05:6820:1381:b0:707:7495:9458 with SMTP id
 006d021491bc7-70b889a0262mr296293eaf.16.1792697900408; Thu, 22 Oct 2026
 12:38:20 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com>
 <4e031de2-6564-4e63-9102-799a0b435689@oss.qualcomm.com> <CAAnD8RZtjvwOAfRWGyQzaVqPepozCWOkRiP9F-eiG2=E0QKXrA@mail.gmail.com>
In-Reply-To: <CAAnD8RZtjvwOAfRWGyQzaVqPepozCWOkRiP9F-eiG2=E0QKXrA@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 12:38:09 -0700
X-Gm-Features: AclHuK95qFCeUwl242qMGo3Fu1gmxqdkDvdX3kdt1R7h9PnHSpX_D8gdjAjKyps
Message-ID: <CACSVV03n3WD8pF0i1UC-HSJAqwnAhXio_oKMD=xP2=dJJnJysw@mail.gmail.com>
Subject: Re: HP OmniBook X 16 (X2 Elite, Mahua): DT bring-up report and questions
To: Jeff Roach <jeff.roach0@gmail.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA3OCBTYWx0ZWRfX6i8yeYkjqBG0
 a3PNV25tYq3QN+fCoTO1SHUUeyUnppOWeCPBrGYo/8e//e0ZXIP0dFDmvpIG7XGkQKfcPXXq8d+
 a1mflTTVnG/myoDEtZ89iSn0hrLhlnsL9GRkTzpeF+reT+ALoSEPVNlbw4kFNbr3kXRnDrf4ePP
 /jJcjC1d5UgTHW8XvI1hFCAFYx8OFBE2eP0xwKyhzcSfWjYVHHXfbZPGnLTf1tpo+uOxvTFXa/d
 larvYRar5XKBHT3kLuJ1GMTM4nSKA/x7EVv//+dNNX+PzOk03M4e/uWS4rP/+4R/6rNB8EKR0Qv
 iZvYd3jdSomF0qE9q10zL2gUR9MtsBMiSop15mNQKiZDcTGh3vA8avquUZhw1P/prn89ENcHSih
 1mOxsoQihya+nseJdPYRc0AEQkXHkv1etoS4PyrAQpdh1oUbJ6Cd5/Hl2lmh8a/v4duzzXLB3wl
 yQ/Brbu5V2hULWsIxlw==
X-Proofpoint-GUID: rFOt4biRWsjhxxOfTMOb0ypH5A3DGotH
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ada662d cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=OfTDJP6xk-uteGZONjsA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: rFOt4biRWsjhxxOfTMOb0ypH5A3DGotH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA3OCBTYWx0ZWRfXwmDtr16x5hxS
 XDYwPe588a/RfPejiV59W/aboo8eHHkJOnzJjcW404RLw6LB3SQd8lPEw5ydwS9d72KaJYiRWeq
 J3wlzH+eG6M/CXqUG4P5+tbJf5CKofM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220078

On Thu, Oct 22, 2026 at 12:03=E2=80=AFPM Jeff Roach <jeff.roach0@gmail.com>=
 wrote:
>
> On Thu, Oct 22, 2026 at 3:17=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualc=
omm.com> wrote:
> >
> > https://lore.kernel.org/lkml/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.q=
ualcomm.com/
> >
> > Please check this series for Mahua support, especially the DT patch.
> >
> > -Akhil.
>
>
> Thanks, that was it. I applied patch 3 (drm/msm/a8xx: Add Mahua GPU
> support) and patch 5 (arm64: dts: qcom: mahua: Support GPU and GMU) on
> top of the Ubuntu 7.3 kernel (msm.ko built out of tree), and the
> rendering corruption is gone.
>
> Details:
> - The GPU binds, the GMU firmware loads, and there are no faults or
>   hangs in the kernel log.
> - MSM_PARAM_GMEM_SIZE now reports 0xfc0000 (15.75 MiB) instead of the
>   full Glymur size.
> - gnome-shell (freedreno GL), a GTK4 Vulkan app (turnip) and WebKitGTK
>   with GPU raster all render cleanly without the FD_MESA_DEBUG=3Dsysmem /
>   TU_DEBUG=3Dsysmem workaround. The WebKit case used to cause CCU write
>   translation faults and hangcheck recoveries; it doesn't anymore.
> - GMU firmware v5.2.38, Mesa 26.2.4.
>
> One caveat: the newest released Mesa (26.2.x, 26.2.4 here) does not know
> chip id 0x44060030, so I added a local hack in MSM_PARAM_CHIP_ID that
> reports it as 0x44070031 (Glymur's 3-slice X2-85, which Mesa main treats
> as the same GPU). Is there a plan to get the new id into a Mesa stable
> release? Until then, users on released Mesa won't get a working GPU from
> these patches alone.

The chip_id for mahua will be in mesa 26.3 (which should be at ~rc2
right now, final expected in a couple weeks)

BR,
-R

> For patches 3 and 5, with the above caveat:
>
> Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (X2
> Elite, Mahua)
>
> Since this is outside the series thread, please feel free to carry
> the tag into v2 by hand.
>
> Thanks,
> Jeff Roach
