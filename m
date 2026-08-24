Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F883AAF62
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787560013; cv=none; b=FOSTgvHWRyYSJCwIPofPMzonmescZKWHWtH5zdxZyRFbzw9Zd9Cgm+GniOm34uqiAZSn+VVDOnjghrzOhJ6MVRujXU7XuhZQk9fuCkmy5JoHaJIhE/qAcYWQNpOUR+v8AB2pviKIKyMoSipHgpd4gxUK1wctIcvOGyADoAAKYPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787560013; c=relaxed/simple;
	bh=Dd+7IFNuFCUaFNilAT23AV3amNqbj8E5ancLP8ZE0yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6FoMIyVkh6Kcd+J4gQfUuery6PrZCKokUpmczIalsoaULiu23eWhGAblBzyTjM7FzmB44y2trS2Pzv5C0KJh11bP9c2DklIwd3dBUUWDDA5A3yxz1bUSC7dxQGr/Ybv/Pbcf2drgJ5e2ckA0lxbzmv5lhihPDqYg7x80bgIYlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DkLjcrAd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f1l/qeji; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DkLjcrAd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f1l/qeji"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7Q3D12666459
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rVn8fxYfIoZBJmV1J5r8JZ/i
	ZJ+bvsQgkpm5xup6AAE=; b=DkLjcrAda33EQ57Bsm4cO+8qMFONVajh2yXLiUrn
	VTV0N0siBW4iY7m8a9TkdxUMW9FakiEzje1tCex6qBM2WuLonBh9TSW74JlfiFHu
	Uqyd/+fOUhNWYz3cFum5yDlHp+bD0UOHuwluebRcpjP0HqylvxBt0yeIrji0Wobu
	XLlddOcSxuL359Du8FLuY4w8rLwNysQMRp21oMQobquMlSm/+vZZgNnZZ78vYK2g
	NnfzYvt5nJbZXAJ2qeFVUj5No+juj8HuYxx0HlVvUwzo65vAUq/jhWKB8SNw3jn+
	/3WqqorNZyF08uEwHvxKLjXUdaazhbIRKYKeteUi4gaEZw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgr7pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:26:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e9489f62bfso36935876d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 01:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787560009; x=1788164809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rVn8fxYfIoZBJmV1J5r8JZ/iZJ+bvsQgkpm5xup6AAE=;
        b=f1l/qeji+K248Uk1gVNqQCy2zw7EzbPaYeMdOYlpOoHvcbZaWDeJ767vkVC9P2SFli
         tgakwYNV28/sJKrfHB2ArKRmfElXX6cLydSr/xUB4qiz3kc7BZM/IhuNtNhpzxh6sAuc
         8eNtrud6vMuEuqZOZZ5vD8dp3/C95AXCm6Y85BDZf3ffBYTa/lDPXdBQISquqUz65p2O
         XI1axokzqwGdivfbQIAmZci5lFUGjjw9sfHGz+efj7ObEUqixyok412QiDflviI/EYVH
         E1g7+3cfyWMuKfKG5qafwdEhnzwjSwHvFjZNbB7laKyFS/HAcw9qxcX8ji7ammWzrKi5
         T8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787560009; x=1788164809;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rVn8fxYfIoZBJmV1J5r8JZ/iZJ+bvsQgkpm5xup6AAE=;
        b=hyiwYK6PEBLjGtLuV1sTFjBK6tj4YtXRpTDI7E5iE7F70vOPe93ckrhHEhtP0NQ5M3
         eN1TTZm3rHgpRXooTtBZ3mjFuxkCCsYtyWEH3ye85L3pvOFOcPupKeCW3tGWf1l+32R8
         DVDQ1E0BirX9Fe4pRS9ksgX23I0wdeuPUJKi8ayDLHDXAccwUbWaFjCjcMsMR/J9ArO4
         VlDWcXy8jArhVWLtnG1awttk9Zjq3uhmHJcCuXd1yBRZxjxP/+E2wbmzBmU6AQHdw+zd
         Kt4yUCwgAOmWHvdsYm2bSFVVT1vw4D/yUKCcKgLxYzpZjgqWe6KiDc7Qhx9V4M1plY3A
         pu4g==
X-Forwarded-Encrypted: i=1; AHgh+Rr3VTeSKDaxEZj8Jdly19/e0lv3bXD6Jk01S3OuiVvXensPqGITRb96FrmQtxoJSE/7+IXUIMnGHzRpWZOu@vger.kernel.org
X-Gm-Message-State: AFuF++kab0+Lx8lgTdnz4XuiQ3L7FalBOOdzYr0LO3H/9ZMjdB2B/huK
	dQx0BONfnaC5oDUfFHNS9ufD3oBklcCZ/xoebQ3QFAOq/o0guw9yzJ9CvV0uSi1gthUOl8rXxgF
	T0bhcOgXrp265TYMs53XCJQm7OIZbX+xSynzjM13J9LYY2DBve1K6f1GZlXErZLUBMBW7
X-Gm-Gg: AR+sD11otmyvTQUhqtYU2j21IGZuJb/UQ1hM7VLsBtGoe7RnLRh+5oH3e4FB9XzoiWc
	UdyUjNMrIa5SAIUpjzbGHCStdhOXeuAwAk8f4QkLKFLTMTusxvRD+CmMtP4i9diOn8+AtJSoQoP
	iQcj2YN5nhqfX09UKtv+ba5jTBXdDq8BFW0TYs1LWRCxjJv0+l6iwC9iPjE4+8ItHEEcxh568au
	+DsZPnMYNrWzqw3bIkT5BRDuQ2GHLBIqigMdgVTanbmtEOMjujXW6V6xc4Zfk9cql4oEzQrV7lF
	OKTk2gte6XBHTtrOuyz7vwRI9wA5XAo/3PK9TALBUSl5WqR0aMOopLNtzEIE025GUz2vfAGmXDG
	o5rY6wfdPmOTF1i4=
X-Received: by 2002:a05:622a:648:b0:527:73d6:f6f5 with SMTP id d75a77b69052e-52e09cec5bdmr164050571cf.41.1787560009509;
        Mon, 24 Aug 2026 01:26:49 -0700 (PDT)
X-Received: by 2002:a05:622a:648:b0:527:73d6:f6f5 with SMTP id d75a77b69052e-52e09cec5bdmr164050371cf.41.1787560009023;
        Mon, 24 Aug 2026 01:26:49 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496296cafsm1165175766b.14.2026.08.24.01.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:26:48 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:26:46 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Paul Hollinsky <phollinsky@holtechnik.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Don't require PAS for memory
 protection
Message-ID: <bxljh7bwnpoes54yucll2wsflskiwbhy7w2u34lhreezpw5co7@chzok7jtx3dh>
References: <20260821081540.89137-1-phollinsky@holtechnik.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821081540.89137-1-phollinsky@holtechnik.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NCBTYWx0ZWRfXyCl5qct1M10T
 zOfLUjQ3EkzrIXnImFko6PQzcdqyVgcQGq9ALCKlheukO/hIM92naCIeovFkSwF6fzHL8UA6gfE
 8iit+4pwDgQYfpJkM7ZT6j1dxFSQOHw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NCBTYWx0ZWRfX/HBAbvgs7s9T
 mYnXoT61JdI8zmQ3TB81imjqlknkh682c9pwLp9abo/VXZ9m80Nus11gnZ0APcxdcx673RbRv2U
 AsnzW94lntocJJezxVmSsVaRbo7c7/WFzQpP6J3R39qGZES9Tw9xRHjnk8VpY75P3D4QDrb146Y
 dA8K4m9QGvDJmfxGAj/zFDON+owSnKgSe9nyYyLKC1iv+aqke4sqJQl7C1XzYx1nXCJu01Lr1m/
 VjepX7wTXMhn1XmFN7Wb+LS2ONU+OnoqfAudvmSdVOBMvQQN81fYaa71mQ6zGvUVajltAskAQJ0
 PwO3qAiP5NV8Z1CdKRnfUnpbIocuaYp3IZOyy3ScDIZ1XDKNcAupq2UVpR7655Kh4GOgL7HjGlW
 Se3gInMctkbdQyY6Yxq77GeLXMyhWZZc8adFPNgLkQe1EbAAE1G+kYMKzeFYkDkBhEmz0rx10Rs
 v6jdWrZySIY+8chWOXA==
X-Proofpoint-ORIG-GUID: A5kEffKEkyAwssARIPwn3PSHF5yoacei
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c004a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=8dbcrQVTAAAA:8 a=EUspDBNiAAAA:8 a=O9LFjDSsXfd6YXdYHBYA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=2958AbVqUNA9gn3SDOjC:22
X-Proofpoint-GUID: A5kEffKEkyAwssARIPwn3PSHF5yoacei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240074

On 26-08-21 01:15:40, Paul Hollinsky wrote:
> Commit f3b1357673dd ("remoteproc: qcom_q6v5_mss: Switch to generic PAS
> TZ APIs") changed the probe-time gate for need_mem_protection platforms
> from qcom_scm_is_available() to qcom_pas_is_available(). Memory
> protection in this driver is implemented with qcom_scm_assign_mem(),
> which is a TZ service distinct from PAS. The only PAS call in the driver
> is qcom_pas_mem_setup(), and it is already guarded by need_pas_mem_setup.
> 
> No descriptor sets both flags: sc7180, sc7280, sdm660, sdm845, msm8996
> and msm8998 set need_mem_protection only, while msm8937, msm8940 and
> msm8953 set need_pas_mem_setup only. On TrustZone firmware that does not
> implement PAS - for example SC7180 Chromebooks, where call-availability
> queries report every QCOM_SCM_SVC_PIL command as unavailable - the modem
> consequently never probes:
> 
>   platform 4080000.remoteproc: deferred probe pending: (reason unknown)
> 
> On those machines the modem is also what loads the WLAN firmware, so
> ath10k never receives QMI and wifi does not come up either.
> 
> Gate memory protection on SCM availability as it was before, and require
> PAS only where a PAS call is actually issued. Keeping the SCM check
> matters: qcom_scm_assign_mem() passes __scm->mempool to
> qcom_tzmem_alloc() without testing __scm, so dropping the gate entirely
> would allow a NULL dereference when qcom_scm has not yet probed.
> 
> Fixes: f3b1357673dd ("remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs")
> Link: https://lore.kernel.org/r/20260808034716.58888-1-phollinsky@holtechnik.com
> Signed-off-by: Paul Hollinsky <phollinsky@holtechnik.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
