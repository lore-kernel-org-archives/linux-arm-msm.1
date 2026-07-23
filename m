Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5772F379EE4
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 13:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784811819; cv=none; b=Y3M93Mi3BSJAA/8BiY5xnUJOz7SH4ldQOLnc5tXj9IVgve9tX3bVrKNmqPzK6LZe3aQS2TK7Kzo2W3tUfGeO1eSuXv25jRZotN0FI6Y9ZUk1U+WbetdCjODPmGlMJSnT3D2MrE1/1hjcouX9+hc+ZCDJm1UPBkpdhej28QytcEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784811819; c=relaxed/simple;
	bh=o4I21Izv9BhqeNzRRuSgO3vorZoOkvzJ/7C19kIPh/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZ8KzBH1w/xfCWCYI7cCK6gRyIgHXgELSz0LO8r+UxXfrK0T6n/rNOPPMR8FL4Nu2G2aapUFBmKVXY/FAH8LNULybjIQ+RwI7rGO+CA+M3XmT4KIOAKkGGSDjDFm2nX+aI/38hsZcphVBkYAUG72lbBEahlyK4am30MvMRqoetg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pX9MhGfn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aW8yvnf3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pX9MhGfn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aW8yvnf3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvpfx1031498
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 13:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNSSLfxtoiUMkYrN0H0VYtMiS9IIkqhLoMRgaUQ/d9k=; b=pX9MhGfnt1WQ8PVN
	JO+Zt0Mc/BbxqCMj8s8WwkqpJANa8ojXWaV+oMjOst4HkNViKzrtqkFXtANm4D/t
	3wuXoScRh67SQ4GoMJciNrzMY3I7rRJ65cxjmF9498scJbeeoW9+fIvgVCeuOUGr
	fzWyZVOsvngWKHOzjr4DqxcFd03SO4EPKPxkS6fibwGSWWs8XqnHdR7CVD5T2M8w
	OXQfxdLIDwMR8qnDhsWjKLvOa1FDd8aePtEHMLyF55YZueDeeCh8++NMKd3zziKG
	YIOcjw/MMhkzWAvJNREXAgQEfdR/gUFbD83Wv87CROEgfxLBuJCA0SyIurxM7HCx
	Qr1h2w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xv6dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 13:03:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfa45b280so1679881cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 06:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784811799; x=1785416599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uNSSLfxtoiUMkYrN0H0VYtMiS9IIkqhLoMRgaUQ/d9k=;
        b=aW8yvnf3bR2CK+Cl+zKi+yaLSCFW9H585HG+kPH1KjwbCL7LxGsK9CwYCsBZkAdH33
         pe17urlP5WGwfXWkXwsmpvT35DlGRk47pQllWzLbx1riE7tT1DDVtv/rqO0QGT1x2vfb
         gOj8FL2yzDWYyH6LQQdJYPR0gByLpeN5319ACosej2RDqgi3M55Ej8DZ7jLFoh5VocEf
         WZlVrWCW33CmVFBsYLKpkrCsEr85MZjATvvcWoCS/zxqxqV90JiOMX+CxMW6hDJYlq1k
         vvqN6x2iSd/RpDQPoXPKaMDCTTYaUOnwGCLwkFsrXWNgK15MiEng1e8jMTW9EekgZIJY
         6VaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784811799; x=1785416599;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNSSLfxtoiUMkYrN0H0VYtMiS9IIkqhLoMRgaUQ/d9k=;
        b=oXe8+2CSUK9nHQoA2AEdeOScS8/UeCWBoOU8XWRsVmBZr5Zc2SgpHExNE92sPS8kMl
         mPVI5avs9uvOtJNTuKEac9NBLPg73g8MC7+32Jp87MxAYa/8sMHzB8+Ya5hJrCqzP18m
         2zjVtxWFnLMm+shS3XEQ3M1Mrh13K6y1/WAjmYvTFxcOumZeu8GxuZdxeNa7/P4DUjn8
         hPXn86avGiPBl9psxjHGahMwbE3qBc4hCg/XYuTRkbyJya39QpXEzGEP2EFugk0pZddZ
         g9Ul3cC8rYO+UJsbzqhXJyI6tZ/doI1kJxbJK9Qjy58nIL/ynsH0qymxqsEpgrpnGDiU
         DGEw==
X-Forwarded-Encrypted: i=1; AHgh+RqUKrhFG2SVI4IcUi7Ty7RdYxG/u2BHpMRdLmMrab8EfTD3FUeT5n9bRbQ/0UxaGgHh2VomzZVIJT6I3VKM@vger.kernel.org
X-Gm-Message-State: AOJu0YyYKHF9GGjlpm2Pmvq6RKX6zonCImeC6CTQHpbezdIf/aHyIOHm
	fsfPra0RxHHNdbLwcpdrSavNT1DuKbV/90pzouVuIw7Lwm07zSFCk/kEM6urbShI7+hZbKM/31D
	rjA5UIhou8Ap2tPRdliBt1hDt2ZRGjZVcRlu8o6QYDA0KMsAKfRAlmCdxKr5c49eMrAmr
X-Gm-Gg: AR+sD12Cx0UQtXiwDb2pi0JfahEonB1wZeaq2R+nhm+9jDMYsOYZW8rFNdaZ4ODq3sz
	UgC8oNLic0zLkY1RjxmyJcqJf32wm++yXL8zMIR7oLGDhxXAFNmYoIQzG/LspvfCJyrTq66wctw
	9p0BzcG8QKPMn6Ym/91UKpo21PT5SkSF20TSJb9DSwdSDFbgLdSrW4GSdzm1tKF6ph1dqQtXRkp
	qdy8WlNZAX0LwnvQqj03kO6qXnUlBB5UPy2lNOHALvAYAcf82N4k13zycKayYntXTwq3kd546Jn
	NagSJADprWbsTOv+eAgtyqzEfagCwdHZGbFVK11Cz1AOhwuyzxmefBO9eFlgNuoA0hh4c3VNnOW
	egtyBW0BFlPCF/M05aMLCSCfD
X-Received: by 2002:a05:622a:64f:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-5283db3bd2fmr22151581cf.0.1784811799019;
        Thu, 23 Jul 2026 06:03:19 -0700 (PDT)
X-Received: by 2002:a05:622a:64f:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-5283db3bd2fmr22150981cf.0.1784811798317;
        Thu, 23 Jul 2026 06:03:18 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9f48edcsm991679e87.73.2026.07.23.06.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:03:16 -0700 (PDT)
Message-ID: <b23c6186-bc24-4312-b5eb-3a6c5f459b55@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:03:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "scsi: ufs: core: Remove unnecessary block I/O
 quiesce for clock scaling"
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        alim.akhtar@samsung.com, avri.altman@sandisk.com, bvanassche@acm.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20260723124733.341789-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723124733.341789-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vRMVim4jGpZOCpUMwkwBaaSSNsklIjF6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyOSBTYWx0ZWRfXxpOQJfXq+pOa
 WHhRBCmLEnRabs5HbJEjO4n+EKWRX527Eo+XZEzpWG4ejx6qTRevh7T7f8gjyvrYPD4h9Dy5Ori
 3RwhL7aJZo9+YkbD/Vwg3b360AthahU=
X-Proofpoint-GUID: vRMVim4jGpZOCpUMwkwBaaSSNsklIjF6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyOSBTYWx0ZWRfX3U7KTD8BCSVL
 DUeVoJm009AAoGhEJwQHnacZ+AlEeZkGD1xFm+nh2njSsIdKqnJCyXP2vTJnaDxE2700PcLZ9T8
 xuiUFPIzvgWp1rB4mjNGbugSOcT0Y6u88BNiJtHudXelfG//rx9B6RbcX/SjRs4LMbNIvQE4pn6
 dHFevaY2+wusP1vy2XPY2bl2/6nNztc+MSqFSuN9PRsq5dzmXS9BVlecJ2BePcLG5m93/m6BUQA
 5Pzv5Y1YHWjRFh0VTY+sEBWiLQ2kfXhCUaaCLXKbE7ZyR4e/zMt+UlGXD5s6Pq1nE5/v8qKMB6W
 oTgPiAoxoWCHMiDjMSNSSTh4oqUoTw+kAxR7ieLPL6F3+R4AupHm4J5IFj6HYIIw4uOM5Z+juRu
 RnvzPBnUBENg9e3qOTCdgUtuwpKtdZDsO5FbYngI/dVlxGD41hGZuvi9ATyFwdrxTq/joxYvm7r
 CpiprDh0KYDXxwyHngQ==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a62111d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vq3bXs1Fwz2bHWXBoJUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230129

On 7/23/26 2:47 PM, Manivannan Sadhasivam wrote:
> This reverts commit 85b2b966285498e1b551ac85f02c79cd06c0cff0.
> 
> Qcom UFS Host Controllers do not support scaling clocks when the traffic is
> ongoing. But the offending commit removed the block I/O quiesce in the
> clock scaling path, which causes below UFS failures during clock scaling:
> 
> ufshcd-qcom 1d84000.ufshc: ufshcd_check_errors: saved_err 0x80 saved_uic_err 0x0
> ufshcd-qcom 1d84000.ufshc: ufshcd_err_handler started; HBA state eh_fatal; powered 1; shutting down 0; saved_err = 0x80; saved_uic_err = 0x0; force_reset = 0
> ufshcd-qcom 1d84000.ufshc: pwr ctrl cmd 0x2 with (MIBattribute 0x1571, mode 0x11) completion timeout
> ufshcd-qcom 1d84000.ufshc: UFS Host state=3
> ufshcd-qcom 1d84000.ufshc: 7 outstanding reqs, tasks=0x0
> ufshcd-qcom 1d84000.ufshc: saved_err=0x80, saved_uic_err=0x0
> ufshcd-qcom 1d84000.ufshc: Device power mode=1, UIC link state=1
> ufshcd-qcom 1d84000.ufshc: PM in progress=0, sys. suspended=0
> ufshcd-qcom 1d84000.ufshc: Auto BKOPS=0, Host self-block=0
> ufshcd-qcom 1d84000.ufshc: Clk gate=1
> ufshcd-qcom 1d84000.ufshc: last_hibern8_exit_tstamp at 196451913 us, hibern8_exit_cnt=20
> ufshcd-qcom 1d84000.ufshc: error handling flags=0x0, req. abort count=0
> ufshcd-qcom 1d84000.ufshc: hba->ufs_version=0x300, Host capabilities=0x1587031f, caps=0x124f
> ufshcd-qcom 1d84000.ufshc: quirks=0x0, dev. quirks=0x310c4
> ufshcd-qcom 1d84000.ufshc: UFS dev info: SAMSUNG  KLUDG4UHDB-B2D1  rev 0400
> ufshcd-qcom 1d84000.ufshc: clk: core_clk, rate: 300000000
> ufshcd-qcom 1d84000.ufshc: clk: core_clk_unipro, rate: 300000000
> 
> Hence, revert the commit to bring back UFS on all Qcom platforms.
> 
> Reported-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Closes: https://lore.kernel.org/linux-scsi/al8YkXydXJQZrl_Y@QCOM-aGQu4IUr3Y
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # SC8280XP CRD

Konrad
