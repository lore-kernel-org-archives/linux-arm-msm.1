Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7966F38757B
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 09:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009258; cv=none; b=YHdr1+S73AHmGGPzX9UtyTaGAZsS66DmRLasM4RGH/GLAoitRZa+pv76J+G5GjvgB7z4WrNqojjcB7bP0Xw363H49CsFprM41jNrpYAMpoONLpUR2cDOowVpTGtBJ0fwne41z83D8+713ML9BCWzuF4jcJlFfutD3WeuOUJKsjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009258; c=relaxed/simple;
	bh=2+IIh+YaaI3upzK6XxNu/VDC3LcxkPF1DIyILN9NP78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nK55nlDbg44ZGL40rSFI4BNoaDpKBy/g4BCGJ52cWrp6NhyU/EwcRkD6HmaFdT6uFfXQikiHYYgPRjX7y/WlVS9bZ/8JNGb2DVhDa5EK2XY8BL/9HFc+AVh85SSD2Dieau2NXRSrOhB7CvQK9OXMDdJqCSbilurCf/lo821Z0Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckim+fKt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y03AQI8t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckim+fKt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y03AQI8t"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769eoBa1288462
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 09:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IOdzPcc7b2tKDYHUhaw2Emyx0bsIqZcJysJmH0I7aws=; b=ckim+fKtyU2JD5la
	hbrb5ve1fhfwHtQY85GvBbgkw4e5ICFDRbPfuVQJpIogiOPPTWCIqpRSalXQHpiB
	AzvfozVd0byq/xzCJqJidIL9fFzQCt5uoFmmWFwUgWXuiVFzGHLE2Lj1NsIukCB7
	vGxYIVjtYensxX9fwkRA7n7gexpiH+5eqGFUZ6JQ3vRnsOFLHoOemeXpAVOZxias
	Pi+OGs7n5UIk02aekV9NyPFnGkopBs26/EFWedOnEp7/iiK0Cw5anNGhv/qaMJqq
	VFiB+Bd3K+ghmnxDzGukyXfns46i5KWxU8vrz9QRnYnBna0ZaAQq2R/rpmxibDcM
	XbgFgQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvp728f6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 09:40:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bf321d786so21615971cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 02:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786009254; x=1786614054; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IOdzPcc7b2tKDYHUhaw2Emyx0bsIqZcJysJmH0I7aws=;
        b=Y03AQI8tmQj0SpKlY7xSOcjuRCFyUrA6UcqeDl4mRghYxUgDp8CoIgBzVmgYs6dNEe
         sDytqZ2CVvUUV4ANPgK74XPgG97Eo9j6if6Z8abbmj653HR1va3j/FcDpLq/VEc1bSCq
         oda3eQDXqdf7lbWj7izgwwVT24YDJr2sMufpLVfK1urpgSLiGF+8vEGRlb1qtOVaRQq/
         uPvhbjxsuOAcPvj8TSX6h8NA9f9z63FHaMf2zNysq6GUMektvUO1UezejXmTSulP4yBU
         n54klGUhih4Mr0E/ZkfIugTXJ/mWfbZdzvthjNmFfl4mzgt5YW3616BqMHCpW2xl4bCH
         XQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009254; x=1786614054;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IOdzPcc7b2tKDYHUhaw2Emyx0bsIqZcJysJmH0I7aws=;
        b=fTpE07wAnSk936u6T2RkzHDoikTF0X8ldy9U4XSsIZ/19dkfivanEvaFD5iNRiOeP5
         65K4ExGlzwN77QrEIuGlpjOCWhjLBR7272/iaaFcdE3u8oRPSqp5AOemC3nck6/UlxGr
         aawSNieVdILYWLanvo49KcjSaws9PckZybKCmdYWnjqMyFJQdCrLvyR3zjkP8JJf5z/Q
         vSg3ZzcjTLG7gVZMkT1CJ5Yg6DiGosyO735rEkY7ERnLEJXGTttng485IjVUHocuviMu
         NXK7a0QDtWFhaI3/4CVmkhh7rdpxsqU8Ynaffhv9tf44VOqEpwt5BkhTmWdNXr2bWW7Z
         RtSw==
X-Forwarded-Encrypted: i=1; AHgh+Row232dylvJ9xjMaK6/kPdcnfYQay24D7mKsn3TsYM155HBUTjRSuyqkfyVP5qqWksVFeLyPToBn4KX14Z1@vger.kernel.org
X-Gm-Message-State: AOJu0YxgICQe7Iu19We1keCcgbZsemrvUklQ03Fr3Hbl2tlJDYUoyAZB
	tOqyKZ2Q4d0QRz/dX1hjW5aYzyMUfaVl1/vUcobnPi4qAKWp3SEQJrXYRh4l4nIpFYduccae/K5
	aPKz2poIFtyMRy1g9wwUxWYKEtap27hgNX73SyyJsayhR7VktX3MHvBSba5C8u8EGMeDE
X-Gm-Gg: AR+sD11Ocjxprmu/u30e2wwegYTsVH1NuKYUiQ4Z5KlrMkDYvI+jJlaaF0QpxMq/J4q
	tyj1PEbxVLqxKfq2zww5U4r/mtBInw3vXMyETHVSDZaXumwwFpanbwDI6RhYRySNES5dBX9E5mM
	/iiCgqOX11Hgruulkgv7oZ+1r1uq5NI/Ws26m5aI260/eR44uoNIs689QdJxve4gTaue1msZfSk
	ZKuRMgRZO8tI6YuMf276kAARER5vEuvXl7PuKira0HWN3WPMArks8S4+sJJMziCiZM2BGhrp9ri
	Fc6y4mvUeUyfhIKdOjIq+0jkuU3uViYXfgfBckMjQ1KF7CQD2vcl1wxbJzX00hRmfPDeBgnXIPe
	+FxWJoAw8nITDj7cVePwUVIOr+Nz8m3v+YVbt0e3cNFOylgmW4j1J8C69tCi6uJRLDTjr6F32qV
	rfHU82w9jvE8vnEA==
X-Received: by 2002:a05:622a:60a:b0:52c:e0bf:dd79 with SMTP id d75a77b69052e-52ce5f7f999mr135415131cf.16.1786009254524;
        Thu, 06 Aug 2026 02:40:54 -0700 (PDT)
X-Received: by 2002:a05:622a:60a:b0:52c:e0bf:dd79 with SMTP id d75a77b69052e-52ce5f7f999mr135414831cf.16.1786009254035;
        Thu, 06 Aug 2026 02:40:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f6235db6sm615847e87.4.2026.08.06.02.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:40:52 -0700 (PDT)
Date: Thu, 6 Aug 2026 12:40:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev, linux-arm-msm@vger.kernel.org
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, devicetree@vger.kernel.org,
        conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v7 2/9] soc: qcom: Add QMI TMD support for remote thermal
 mitigation
Message-ID: <7ptv24tcqk6ym3pkiuo5y5klhv52nycwhg2zl5usxme47cmflw@pg3lays6zpas>
References: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
 <20260731-b4-qmi-tmd-v7-2-3befd44403d5@oss.qualcomm.com>
 <20260731105316.BDBA51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731105316.BDBA51F000E9@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: DZ13-_chy78jiQ4W0nCzmRfgPdu_3uf5
X-Authority-Analysis: v=2.4 cv=JYCMa0KV c=1 sm=1 tr=0 ts=6a7456a7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=fmFFBQzJVm4u-eB6PWwA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3NSBTYWx0ZWRfX/9xkzDzvBzu+
 cg3Bf+PilFr71qDJHlCfS5q9wLLfmY1QpNXHtXJ1dJFNDa79LxRpAbPtbLabXO4ZgQSlnOPm9og
 B6VbjXNHeZPfw0KGjiA3Pmi82cGUtJNhAHdLNZkFL3dD4S8gSpB1TmgBNiBywb8v+p7Jg+5huaZ
 dThmBFI7Wz9gTcbD0U0w4mVEWrB+zvDrgMKQ+v4y79Mh3NP+8LoWRG7MirDV2C9dRtmdFsYsbCs
 HObuUddwImxTUYzh9mOirFeg+IrYA219Td2lEnMYlj9o85M15SPiG9Ns2I3DWGqA4N54KMBAFIy
 uK185qxLyvWuI56w+hpWpkG//CXfwKK9TiPvC3nOlUrrI1A5L3hLsVIKxbxzPWeqABp7Me4nIHB
 PQZgiVRLfcBsm1MG3mwRbBEVyqrDUtKp+SJS+Mv6Fu7+UjhWYfjHZVBRh/HBkMntW8Kg374I4e0
 CuOrPacIsyZYqFQgDrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3NSBTYWx0ZWRfX9nQhXewf/DWK
 HxlBlCZA6UdQXeVwQSUMJqySaD+moMouDRw/YLoZejn96Wq4o1p6pnvfn2Px1k43uxUt7SHJ8UL
 9c3xaHoa/D5D7GwnyfR6HTkNEnYKydQ=
X-Proofpoint-GUID: DZ13-_chy78jiQ4W0nCzmRfgPdu_3uf5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060075

On Fri, Jul 31, 2026 at 10:53:16AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Returning success without saving the requested mitigation state when QMI is disconnected permanently loses thermal mitigation updates.
> - [Medium] TOCTOU race condition when reading `tmd->cur_state` during service reconnection causes permanent thermal state desynchronization.
> --
> 
> --- Patch [2]: [PATCH v7 2/9] soc: qcom: Add QMI TMD support for remote thermal mitigation ---
> commit 02c2244c0a2cebd6be4e1bf4e41d51362be19b5f
> Author: Casey Connolly <casey.connolly@linaro.org>
> 
> soc: qcom: Add QMI TMD support for remote thermal mitigation
> 
> This commit adds support for Qualcomm Messaging Interface (QMI) based
> Thermal Mitigation Device (TMD) cooling devices provided by remote subsystems.
> It allows client drivers to discover the service and forward cooling state
> updates to remote processors.
> 
> diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
> new file mode 100644
> index 0000000000000..37e6ef19a0b34
> --- /dev/null
> +++ b/drivers/soc/qcom/qmi_tmd.c
> [ ... ]
> @@ -236,25 +236,54 @@
> > +/* Notify the remote subsystem of the requested cooling state */
> > +static int qmi_tmd_send_state_request(struct qmi_tmd *tmd, int state)
> > +{
> > +	struct tmd_set_level_resp resp = { 0 };
> > +	struct tmd_set_level_req req = { 0 };
> > +	struct qmi_tmd_client *qmi_tmd_cli = tmd->qmi_tmd_cli;
> > +	struct qmi_txn txn;
> > +	int ret = 0;
> > +
> > +	guard(mutex)(&qmi_tmd_cli->mutex);
> > +
> > +	if (!qmi_tmd_cli->connection_active)
> > +		return 0;
> 
> [Severity: High]
> Will returning 0 here without saving the new state to tmd->cur_state cause
> thermal mitigation updates to be permanently lost?
> 
> If the thermal core requests a new state while the remote QMI service is
> down, this returns success but drops the state update. When the service
> reconnects, qmi_tmd_register() will re-send the old tmd->cur_state to the
> hardware. 
> 
> Could this leave the hardware running unmitigated while the thermal framework
> believes it is actively mitigating?

Please address at these comments.

> 
> [ ... ]
> @@ -298,34 +327,33 @@
> > +static int qmi_tmd_register(struct qmi_tmd_client *qmi_tmd_cli,
> > +			    const char *label, u8 max_state)
> > +{
> > +	struct device *dev = qmi_tmd_cli->dev;
> > +	struct qmi_tmd *tmd;
> > +	int index;
> > +
> > +	for (index = 0; index < qmi_tmd_cli->num_tmds; index++) {
> > +		tmd = &qmi_tmd_cli->tmds[index];
> > +
> > +		if (!strncasecmp(tmd->name, label,
> > +				 QMI_TMD_DEV_ID_LEN_MAX + 1))
> > +			goto found;
> > +	}
> > +
> > +	dev_dbg(qmi_tmd_cli->dev,
> > +		"TMD '%s' available in firmware but not specified in DT\n",
> > +		label);
> > +	return 0;
> > +
> > +found:
> > +	tmd->max_state = max_state;
> > +
> > +	/*
> > +	 * If the cooling device already exists then the QMI service went away and
> > +	 * came back. So just make sure the current cooling device state is
> > +	 * reflected on the remote side and then return.
> > +	 */
> > +	if (tmd->cdev)
> > +		return qmi_tmd_send_state_request(tmd, tmd->cur_state);
> 
> [Severity: Medium]
> Is there a race condition between reading tmd->cur_state here and concurrent 
> updates from the thermal core?
> 
> When the QMI service reconnects, tmd->cur_state is read outside of the 
> qmi_tmd_cli->mutex. If a thermal trip point is crossed concurrently, could
> the following sequence occur:
> 
> CPU1: qmi_tmd_register()
>   reads tmd->cur_state (e.g., state A) locklessly
>   
> CPU2: qmi_tmd_set_cur_state()
>   acquires qmi_tmd_cli->mutex inside qmi_tmd_send_state_request()
>   sends state B to hardware
>   updates tmd->cur_state = B
>   releases mutex
>   
> CPU1: qmi_tmd_send_state_request(tmd, state A)
>   acquires qmi_tmd_cli->mutex
>   sends stale state A to hardware
>   reverts tmd->cur_state = A
> 
> Will this overwrite the new state on the hardware and cause the thermal
> framework's view of the mitigation state to become desynchronized?
> 
> > +
> > +	tmd->cdev = thermal_of_cooling_device_register(dev->of_node, index,
> > +						       label, tmd, &qmi_tmd_cooling_ops);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com?part=2

-- 
With best wishes
Dmitry
