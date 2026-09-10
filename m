Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1CF3E172E
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 11:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041330; cv=pass; b=QqtTCb3gg2hnGBev591VOQmrkClMYa6U/Is0X6euc1Wa3ump48vCIcNIyvRbQbiz6YGm6pjtaUKBDQtIornOzoy69fYaVNW99rjE/9vqykJpmiXmJc3oi5N+toPOgMwfa8iGT9HUTZ4hdh6/PzZ6OnjGc0NSI+23u97wM220mHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041330; c=relaxed/simple;
	bh=S0FLkqwloJK80/wATJskq/ItQstxHs/9zbYL1VDZJe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Szyt9x6M+FBXiLSjW5GHIzJTvOsvHsH1+M2qGZ4gOTwoOo8F4rROmxo50vDKXogurMQw2wh02pg1pRHEAEoTq03TL61cywlD4b4IX8SpzbTBBW0hqTPZL95ZRwtAxDHXTIXj4OmsjkfTa1fbwhL2hDyIWVIoaLmRi2nXd/Xg6D0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XHPr1df3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/SX4Qwi; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHPr1df3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/SX4Qwi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8xPbN3468665
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 11:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S0FLkqwloJK80/wATJskq/ItQstxHs/9zbYL1VDZJe8=; b=XHPr1df32s7zoAET
	uTIuamvAgLFXlMPACiKiWZ//xbW0A6kjU/VhM2q6C3c7D6oBVZV2f6aXaCV9lAH6
	5/tSAJ8qOJnm0geGCARPJK8obnAULfLziPc6Z3l7AQrN4onfnVQj9w67MRmVg6Ya
	mge8GSdHsg5mmhf790rp+w14O3dKrUm/hvXIXUfslxlt2bCKNmkdwWVSN+sEQR/q
	KZ6+WnGJUrBcdOo8ldDS9ya/hANMJxBynTBClkoQ0eLSjk6DbC2bYH+ke9WQd0hS
	TadS8ibjvJiSQII1H4szEQl0MtOrpaSAy39Vim+4oA4kZfrgK7zYMhNXoboITier
	abgzEg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gksh8rny2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 11:55:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6fb956002so102895135ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 04:55:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789041327; cv=none;
        d=google.com; s=arc-20260327;
        b=ZTUqpH38UFRdDkapool9dxshVzhjInJSvbP2yhamdFpNNm1jL3y5bX8tUxyzV2WLqd
         3zGRQbUbqiI6Tuq8hsaMkQ7vSplx23kvTJvlXTLWU3iGBjJ7tTp44ZPDhr8nfUepbaOP
         Ztj473tkeAXk0a2Xf6v50EMVCeOBsd4csUMdix4s8EFBibsUj2RhBW0xokM1m26iM6ek
         m3TeaQ9LvIndNdYdjFgHy5RZ7RkF7JInQt6cW3aM99xzWGVKpGB62MlvKEfWpMsr8eYJ
         SQ579W31HlX+W5UyJxK2XQzL6iYytL8kQR8PVh1Iv3ombm8P42nmPD4bUQtx0aSTcVj+
         WSPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S0FLkqwloJK80/wATJskq/ItQstxHs/9zbYL1VDZJe8=;
        fh=yWy+EHAE97+iSGdXeZVOoMCcjCA0uPPvjXZj2a47iPI=;
        b=h5ou0fUaZEFgRO3c9gPM1DO+r7L61gjCUZ1HVBx5GpiJvLbC96mcwSsCI6YqPk1khL
         FJzI5QMHAkuw/BI1Y5JBR0CXIvH0wpMsi8eg1BSWCYUT4gclTYFWSyShUX0iPofKMX8K
         Op77u1oqkClJF6OOCZsFAQcrfyQ6E+XabqosLeHsjF1lHF3sa43d7M0UqsKksr+oj10J
         QK4B4m5lqOeBVrwSxNPxNet0P40VUU2GzkctbrqZBRtqjYgVtDROXYh1pamXg/SSWx5x
         KqkzAWznlXK+lgw0Nsbh3lqA/TYgjxdIg3zVuZH1qb0twV/0qst2MEfXlLTJfif0y5wp
         t6ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789041327; x=1789646127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S0FLkqwloJK80/wATJskq/ItQstxHs/9zbYL1VDZJe8=;
        b=V/SX4QwiKMYIJu8kShQShDZuHOLEghAlBJ86uwtp2ossIGFAWbrS0yZPJzSp0CDlU5
         O5RSXDoD/pftOWPThMEBu7KfXpkvehAdVsN1bAttTGtCvMla/oo7ZVR7cgjYtL5jWMqi
         Br7Qts8pCDn4LBzyoqMtGioKJIje2FxRmP7bEMNsvpXvnG+g5p7ggjiz0B0sendJNjmj
         QLo/riGNlAlzYknALuyFZHDbg+gOxP7MdBn4LqNNRxNLfxFNy+SCGKnF+OAVQD4uEJZG
         q3sFSXfd5K2oQRqeOhUW8VyEyEbbvAf8EBXecmXQJvwB8QcNjQbDNb8FCq2FpK//GVT+
         Xiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789041327; x=1789646127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0FLkqwloJK80/wATJskq/ItQstxHs/9zbYL1VDZJe8=;
        b=JWtweBn3rKDQnOsvaExekvcJQN8v1ZHSwYjM+Pd99BVYVQWJQRwqhVUulBJGdxV1M5
         E1ZnsZOlQKGRu40Z1BeVE9zQg370B4n8zy3hi6/Jqg2eXnIaBO4Xye/oQ78unPuvsvH+
         +X+1Q41Kl5AlLTHAFBATkSr3TgHxu57CXC5W3ZM7MBbhepCo6TBnZpN/zxh+rR3nQzva
         U/h+5mXlCvWkJclhlhcxJ9v2f/B47xT/0UQltXLq02HcSAOjTDmWXXSs+9Lu2gCa6/Ba
         a/JS87BQWYVg30b/5YGcoJLP86KB+QDDmsxRQ0K0YLH+JmK57LImLiF5D0IfM5xQJ5Vt
         bUxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwye4zvXA6xxYZ+rO17H4zI8QFA4QXLepJERHHBhfdTkOLuGDmraMrgwFAeur98dhMd4w8qq946XULzIq9j@vger.kernel.org
X-Gm-Message-State: AFuF++mOt/HyZt+rd4RcgUT9q5bqRMGNZ3o6EUNaq8tiXXpFGBSBR+S1
	CxJTQ17Uy8j+dxDzqKm1+WWOaEwVHMI8lpip8b6ID5K0oAupWh5MO/av+FZeFhyTt6aRC0TXIBC
	/9B13FljhwuihxdUPQsfpSCUI3nXZCddLmsHiMh8GUcKJEW5G1ZbM9sGR3dOqwJbWUq0bUkMY07
	RxCPQUvsjfY1x+cYmIplyL6xtCDgtTz/8h1tcwImv4Ifg=
X-Gm-Gg: AYBFou0ClK9woqwspmEKWCqSaxwfyXcCSV3ETA6l8G2YKOGA8NJEX+6kV8dBGMf+9Gb
	7S4DRKSF3xDiH7cy/dKNbidVPHvxUpA9cP9HRR6HxD2B5sKYCpke0elc3tvnKFO3xsRCc+D/ptb
	RVYTxWdusVZCyBQu7oITfKH4d4bMh8Wf8wdrHm+4HEpRv7fKjI7C9k4zsW3Q==
X-Received: by 2002:a17:90b:258d:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-39b261323e0mr66322497a91.11.1789041327086;
        Thu, 10 Sep 2026 04:55:27 -0700 (PDT)
X-Received: by 2002:a17:90b:258d:b0:396:4c63:7193 with SMTP id
 98e67ed59e1d1-39b261323e0mr66322419a91.11.1789041326634; Thu, 10 Sep 2026
 04:55:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826095217.2885229-1-neeraj.soni@oss.qualcomm.com>
In-Reply-To: <20260826095217.2885229-1-neeraj.soni@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 13:55:15 +0200
X-Gm-Features: AcwNN1X17Z3L39bGH3N9FTd6tOAl9kGgw4CpwVGwNcjsk3O551oqwHOl_exeF0g
Message-ID: <CAPx+jO8hLqgW9aXDcAE2tsWx=tWoxKSJzvs-KQme5UPo4v9kPw@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] mmc: Avoid reprogram all keys to Inline Crypto
 Engine for MMC runtime suspend resume
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: ebiggers@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com,
        quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com,
        quic_sartgarg@quicinc.com, ram.gupta@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: RqgwgCkyL9B4rVOW0V5fp-lHNjGhijls
X-Proofpoint-ORIG-GUID: RqgwgCkyL9B4rVOW0V5fp-lHNjGhijls
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE0MCBTYWx0ZWRfX4QhQ9zWGqsW4
 tjSHG3amR1eLMU5DZ2LFMhkbGS8CFoSWbpuNuf9d33XW6/YMqSXuRaz/iHohsXGhpB9q0kIIhyo
 bLesZZPbgz/IcohqGe6Mvx7vmu5sr/SG9vt85/mbMTu6glRujINtxa8NZYB7GSm6uMm1/hG0JLC
 +ls65rfOwzGzbbleZilraEOETi0UgGmhOWkjvPElUNJYxdTgBlZr2TdeF8vziWVqf1OluXkttLh
 SNMzLY2ZAjmhYkIdEIfEfWx2weXkFd6XcTKTWpUDozvj0KIxU072IAPqaWqHj8gOBsaOS6uDq84
 cPOxJteEbeBOFcJ0S/MfFfAF1Kayee9XnFU8Qpr0LfxrCKtPTd/pC0OCQ93/XgoF4fRgMQr7KMd
 cBA7cxRf1AClNtPA//H3NsnBu5ishqJ3pxbV48JmO7+9FRHtIsOdEQJ9TPqh8dmUWOxNkLyKUuY
 xNVK0tbEFCpbeCvi/Xw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE0MCBTYWx0ZWRfXxcbUuZ4kguyF
 uNN6MJCeHE9r3e6DPdnimphWZ0naTou0UBJ1hkIHeq96Xn8QlRH9FlLt/2qf1BbnGUQ4FK9mdpB
 7V6+b1Fns91G8HCRR1/LcFK43A9YEPA=
X-Authority-Analysis: v=2.4 cv=a56lZkSF c=1 sm=1 tr=0 ts=6aa29aaf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=f4iapASk6-FZxEQnkJAA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100140

On Wed, Aug 26, 2026 at 11:52=E2=80=AFAM Neeraj Soni
<neeraj.soni@oss.qualcomm.com> wrote:
>
> Crypto reprogram all keys is called for each MMC runtime suspend/resume i=
n
> current upstream design. If this is implemented as a non-interruptible
> call to TEE for security, the cpu core is blocked for execution while thi=
s
> call executes although the crypto engine already has the keys.
> For example, glitches in audio/video streaming applications have been
> observed due to this.
>
> Fix this by allowing host driver to control when to re-program the
> crypto keys.
>
> ---
> Changes in v8:
> - Update the commit message for [PATCH 2/2] to clarify the expected key
> reprogramming behavior following hibernation image creation failures,
> suspend-to-RAM transitions and CQE recovery events.

[...]

The v8 series applied for next, thanks!

Kind regards
Uffe
