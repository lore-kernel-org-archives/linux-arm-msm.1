Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7926538D415
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274373; cv=none; b=JGNEsGw9JGcuF48QZ6P3ITUsRRTeZPud49mYbNwpd+q0jlrSmJ1DiaEub9Go0J3nYFh7dihroxT3O3KdiVM8BF7xqOATSV9BdIOnu+xpBUTiQqkKtIjKn6AsE63PObad59IwhwdRAnYpP+ZcZ/v6Vr/TQbh8KczN/zDjgxb/nIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274373; c=relaxed/simple;
	bh=FgutlMLWuX2PARBJ/ZNazI7k/MjjaVYPSOow8B15yCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/6QES7ImTA7s/X8gSA+j4a19GKUnrvpcUB9YosVcXhTd+KqAj4I8lADMJZrEJWdDSZOzDkVZAtssXv+xDOJDnAb0cKIsSRm8lgm+YGBFId17yyBJ4K/Bv8O+rCxTKGShiSZ7HLuA6g035tbDyfwC/45UzydsA1irv7QSAP1Qvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fv5D50Gi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bExOtphG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fv5D50Gi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bExOtphG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8eAW3913722
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 14:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u00WPPm2TIE3D1kE+ENfOWwH
	aQh53p3wPv2JgUWu22k=; b=Fv5D50Gi/UA8VcdWQ5Qla4lhjgQMtRAUkPQyvuE3
	H4p8KsVEJioA8Fcyx0nwYufUZRU3XoMZ0HbYQOKDBhr0kfwoTfjVFkuFOIQP7sQo
	Ly3NSJGv669P/47uyMZGYlu+N9TyHebzvqfOaGFRb3U8ldYujjuw7yTPwn64jJBG
	mgS/zUBDQDPsjpMMDDYbYfsf3d5Z/P6eyQn+QmMylSA6vfFVOSUQEVEWp5EFJV94
	xspE5yWPpeRqFSWbLIZV4M7Rala8Krlj8/wcPD6FwPPQoMaw2JjYQmTRznWjN1zw
	IF5h1VDu31L+CHUbNCHOAKUgSXbkdAFmYHKFyxSMIqwaTg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu26sd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 14:52:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e820609d9so965447985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788274371; x=1788879171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u00WPPm2TIE3D1kE+ENfOWwHaQh53p3wPv2JgUWu22k=;
        b=bExOtphGpX6XRLuJlxkLDbMb7LRF0DxI0DTdud19xrbxB3pxyVECJj6w4K2pvmWelV
         KdEqldF8qccW/t8gd6iiTvfhUikkIUSoUgEb81ROkYGWRO+24rTd3Bx3ouI+hotfvRkB
         O+l2F5E/G05ZHgc/FaibOrqTuYPLRmgaZ1+3BqUwZjFHRNBdXCJFY524XvO6G5wdYA4C
         u6q3AiSwU+nEH7NhDQ/yr0+jdCWOImcYm+JmymBVE85ptG9KzOmBOWDGl3ZusYMk1ZIi
         Sq1TGvTo5qmf/usW6G3s7WFM2Avg9UvqSpymuQ4TG7h8hOkyWkJ5EGkpMaJ7VPifHbrl
         R06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274371; x=1788879171;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u00WPPm2TIE3D1kE+ENfOWwHaQh53p3wPv2JgUWu22k=;
        b=jq+VvKmZjNrFslJ6Y8KrRovFumc6vFUTDGDKz9osmDv7NFF49u3OU0fwQ/D7Cjhe1w
         P9Mi93h0DijcO+1sannQM0nssPNJTWKhRoCfPty3ep6ie2r0JUn14ww/IbCEjWbyc7vn
         yPD1vd2Hu5X79xlZ9EX0jH1EyFeD9i+5sMmmYqoDaOdgW+31+qpxLC6+Eka5DOWonhbz
         Dn9SRt2lK+MNsxlj0r6VbhZKOXAuIwvP6G13JHVI6xHE8SiKGDQv2U8WoLZgKH6BmSqU
         jnk/rcdAr0JErltlFBrxbu4yE15/G4hgzuzC4ooLrkJSZO+nz5Y0VRvvK19+Ez71TGzu
         9gVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrir2RhuhoBoIqnuBemmYVtJ7wqxhsOAS+CVhAVrRR9meNp1XJRLtf841+iTx1sJuyb/otTg55gmhHaqS2W@vger.kernel.org
X-Gm-Message-State: AFuF++nNbjVGFhLGADQxW0mAeTN6aV0QxyMwfFhZgYZxBzVzxVWIHjfL
	iGWMKfsAnPc3z3BTv0voyJmqz8ZWlTL4Ld/GTx4vM+Vf11mAnakAbY4Qwi08ZSNxEsBWsfli09f
	jnaQoXrSpKaWA3FgxPa1jTIT2YWdcGOE/Nx36rLDoc6HnmDmsnKq0Z1iJ0iAq8H69dx2Y
X-Gm-Gg: AR+sD10PXcvfNLn36XLKq8K5rtEonvThFUrf0E/fbj/zBvd8URhccYJ7wisBk4i1v3i
	Byt7ZpK7fyhuJsQBfcuYMCevXI6tgBHd8ZeNuB6B5Md/kP1dub1vJ/BmskLAfMGb5uhJgs4W3em
	QuHMUjUc+Lf+tH+7J0DA1ADWzPzdW7N/BBlEOZfC5oiX7s4Or+Y4UFIKrDFUEwwWyjuRUt5FmUJ
	/4GffaEjuyx84AvK7mRnY2aGaStHpw1GYtAqYx3fu1Y8V6F80HaAsns9D1jsTtrrU6TG5kkN5Dv
	ps29f582jjPo3qOt7DKIuzCxYG/wTjECjOVdsdyRqCg3zqpWeJd6y4ElGnhyBqzSi8qPqZ9BUYN
	+AQ6sKOmng/f42A==
X-Received: by 2002:a05:620a:a183:20b0:938:8ddb:5e9b with SMTP id af79cd13be357-93947f81d7fmr956280385a.8.1788274370644;
        Tue, 01 Sep 2026 07:52:50 -0700 (PDT)
X-Received: by 2002:a05:620a:a183:20b0:938:8ddb:5e9b with SMTP id af79cd13be357-93947f81d7fmr956267385a.8.1788274369738;
        Tue, 01 Sep 2026 07:52:49 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c52fdbsm273345915e9.0.2026.09.01.07.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:52:48 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:52:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Aniket Randive <aniket.randive@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, konrad.dybcio@oss.qualcomm.com,
        naresh.maramaina@oss.qualcomm.com, praveen.talari@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v1] serial: qcom-geni: Avoid double-free of PM domain list
Message-ID: <zcpnlgkc4x3uizna37cysfhgr5ybs5adb6hdqzuuirndkd2tmg@wxsacjjgq64q>
References: <20260901-probe_cleanup_uart-v1-1-0bc2b00c970e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-probe_cleanup_uart-v1-1-0bc2b00c970e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMiBTYWx0ZWRfX0nXGNX7aurQK
 Uo2JGRj7OfubjFSiyK75IuDPX8msP4mzfZBva9/CtEHuV40PxED8Afs0zc+sDs7w+vFd8gIycAJ
 irHDxnHcLRpAgcJWM8IG5cVePtHArpinXTPSXoCRVw+WLqj1l+98Qj8+v6k/xDfXRjqdUx/0Xsw
 pqeWeLclEXm9bzwHXS+6zOl99wMXw4SdxupA9+34WXkQ8VyzKkqIOjOTRqURoPRkGHU66aTWX6e
 McTuSF6A8+wSTyBKY5oUxgpC8PCSCS0J9agN23CM1UNo4SjRQXqTaSYqUSOvKStpiD3qO2dOS92
 Gyw15OY0X1SG3sGVvKfmZqNY9RRDRFLMopNrOweRwktkkudkW7E4VSy6aINtd3okJsasEGnT+nc
 0xK/PqUac8a4jqiDx2rEpB/LD4ZSYL6PlLCBSS+gsUlrlQwBHCp1kGyPPT1xIVvW7etM2w4ODoR
 yAuFhvlNU2sfVzEk47A==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96e6c3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=5Qeq7Wt-fVvOjBGoxIkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMiBTYWx0ZWRfX+g2IIj/vGOXK
 tWcmR2vX77+BjSoB2Gl2805HDcf7tYHjMng3HT9j68g8wFuO+ZdelwCAUY6DoEv5kwDs3o0ElAB
 JEYpE02wKCtU1j+1hWIWyiYFIEQSyGA=
X-Proofpoint-ORIG-GUID: U6u7TZDwwPUFLM1UCYI80rZgxW5wkcVh
X-Proofpoint-GUID: U6u7TZDwwPUFLM1UCYI80rZgxW5wkcVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010132

On 26-09-01 15:20:54, Aniket Randive wrote:
> The SA8255P UART variants attach PM domains through
> devm_pm_domain_attach_list(), which registers a devres cleanup action
> to detach and free the PM domain list automatically on probe failure
> or device removal.
> 
> Remove the manual dev_pm_domain_detach_list() calls from the probe
> error path and remove callback. These calls can operate on memory
> that has already been freed by the devres-managed cleanup, resulting
> in a potential double-free. Also remove the unused pm_domain.h header.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
