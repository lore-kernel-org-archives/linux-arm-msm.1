Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AD1345EA8
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811302; cv=none; b=dolfusUAu65PqrVgZYY4k3EJFvV7He8W/1kxh41nwDW0pv1q7YziLxWAFxT85LwtD2JfmbG4IOOZyq9Ad2Z+doOBXPveaSctSx87CTciopkymPmQJQVw0I1yNetCbPU4R8z1dJQ+03sMucOmHWdr5OLvcvPVR8DbDyKUYo84JQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811302; c=relaxed/simple;
	bh=fH3LzlK0G+6cdVw1UBUL8BjAzugIuxnjoK/VeZpGwFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YktHZK3HMoKzYjlZr4JKH9ARewt8bTRybPFdlPjQm4cnwqId1ol4ROvFVKv3S3pXkAVTyXkrnQv0QXoDXKNYLP4LM+5hSbVjt5409swod2jRfe6zuedkZqEJpbjsC4prTllazTYnA7gyeSwSIlzhTNA8MIkv4Z6CpDiWJWSIE+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LeY1ceSL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c22qkA8U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LeY1ceSL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c22qkA8U"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC08C41933238
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gg2xEwxVLLgp8a6YohmCiiIF
	Vna8WCqyVDg5jFOpISE=; b=LeY1ceSLMRzrbGK0i7Z7mPYEYYJBA52eYbFUqHZ5
	lH4tuVs2C8RAmfmDdQCryHjM3W/3FncLC273SoU8DcSq5155BH80/fj/2ufG9nsQ
	SIP0qc9rZb+lNTgRFh17mdoX2xQQN+dyfa9JYhUtG31tDRCIBkA6nhqrehadIJnR
	mq5QwG0vE+eFzkB11XbF6Fh6lGR5emeefKwbKXdUwZKSDc+7A+bnrWKQuW+ju64K
	fS7XhqVWqLXk3W77TvjlYt9O/XFM32F3cK2qcdl3ZaU2HGyD/miw9l2nCqhUryZR
	K7e0WmpJdmYnXBhUrzGWSlJwQ7Fk0yV9Van44js0aRv7iQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkjc3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:21:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a04491c56so1114780eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791811299; x=1792416099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gg2xEwxVLLgp8a6YohmCiiIFVna8WCqyVDg5jFOpISE=;
        b=c22qkA8U3K8E4pLHhe7IqhGqt5ugQ1P+zKWEWW2iZS6mD6KzmfWohpCro/S6j1LZ6u
         PqeFkhlHgF0o00Dxe+D7dnG2phPmc/ar8W5T3yDQe7S2VKEg838ySysvtE5zjfhPA1WO
         U6GrCpDgCPsZzf7Nq9TyQnS9QtPd665/Zx8PuH6FjkyTgcR0umnObLHrKaOfz/jmCRE+
         VGWECNPZxCXUT+oyGyhu3YCaWh5/HFa9c+rLLS+FCMfvEhWKJigMgq4G+yErYKmrqxKg
         cHhDCnNg0mDI766qoKqLEOX/88dd0mxw/ndVXSrpIe9k1qSMXhyfUJgKuWkgsupIEZga
         syBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811299; x=1792416099;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gg2xEwxVLLgp8a6YohmCiiIFVna8WCqyVDg5jFOpISE=;
        b=FUZeyjz57cEKyMgSf+VAlvwtk/jUm8afr/GE45A3dQV+zZSkwD4AARqnuZtS7kdLr7
         p3WbT+foAwpX5xgkuCW0Ek37aMsdjyyl8KEOC7iQgiUItLlGb9nnsS9pWMCrENlPR0Mz
         NDjwS3pD0D/2bG80nOcJCAnItJSjDo2eXQ8V/f+47bbRR7tgCKX+ur/ne8tHNpkMyxuR
         8v6b2QNW0KbnCSWObv4wrAKAZWGY0JrTElSmIt9YgiXgUOCrXKoQsHeXe1zL2WklUzTY
         fCMTp8FQLnZ1nNBV9JzTfsf5HqsYv/5cqsMi16I0ss+t4jsqdoMHT7l1fpBaoc+fQEWk
         yS/A==
X-Forwarded-Encrypted: i=1; AKwUvBzb8n4QCsq1rfBX03/oxrDr2DfJST/w42FfQ6xCSn+Zj56cn5jqqXNymob7tsmucJw4ZOlL/Hkx9dDqqSgQ@vger.kernel.org
X-Gm-Message-State: AFq9FYIWj694foukYR60t/E9QFkfTd9uWp/QxD3mxUzRxO59qCkUBuiO
	+uiuVqaquktLj6IVKthnhnyjbN425elUIpLqt0gHwNrTfTIwrNgMw+2ByvV9WaZRjLXm2nFBdD9
	4MdoqX/SOvStmbExn8F59Oj9jqs88bNsRsgA9ht4vKxXKNe2IcQogwfUdg0kUHAxB6VBu
X-Gm-Gg: AYBFou0S+Zv9FiXyPAeGTDC8RjSHM2iAZBTdcyQ8sUcM1z/VbNLztzUXYVSyf9VbFTN
	ByhIKB92Nu4vo8/SMJIyzMRqbPVTGwjEjrDfX+5dXmSyRH7B/m3tjwk4sJ3RhWF2PFWfxr9YI9u
	qp4lj5+N1faK3K3Rx4d0uD+yJhxCG5Pa3+sfX10EKZcrkUlfei+iioV80wqwuusYAvvJXJswcVA
	mCQAXv/d+PH51oZKZtDRzFMBSfLI+wJHt6luCnywDX7QFpkIFPfTEUMS2j72gUbIXhavbskSh8E
	IeUsLJQCbnJHdCv5rgDGq8IWlK5Y8iRSEzzkcFk4vy8wXZZdcBbMG+6LbOx0B04J5fMyZLDNU8A
	Yq788BPUJGFFGv3IopWE9+Ap9/2xaEcpBvdb9WBAh1w==
X-Received: by 2002:a05:7022:3b8e:b0:166:fc9a:11b3 with SMTP id a92af1059eb24-16a1206fed8mr14144248c88.12.1791811298537;
        Mon, 12 Oct 2026 06:21:38 -0700 (PDT)
X-Received: by 2002:a05:7022:3b8e:b0:166:fc9a:11b3 with SMTP id a92af1059eb24-16a1206fed8mr14144192c88.12.1791811297876;
        Mon, 12 Oct 2026 06:21:37 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3593b8b2ec7sm19151010eec.4.2026.10.12.06.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:21:32 -0700 (PDT)
Date: Mon, 12 Oct 2026 21:21:22 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Subject: Re: [PATCH 0/5] drm/msm: Support for GPU in Nord
Message-ID: <asze0jREeXmrItcs@QCOM-aGQu4IUr3Y>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
 <assuimpZe3J5E2rs@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <assuimpZe3J5E2rs@QCOM-aGQu4IUr3Y>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX2AohMazckFBr
 WKyK8LKkA5VdcGnUxZnv3Y1ZzncSFEHl3E0wny4nDcE5W9/FrIWJ61SLQS1cuyVNRdgFB5Gv/TG
 LMeLUm5Gq//Say33u/4HEzjR9jNZJxLQVf3G1mOWLgO7fgC1LwifSPXgcRLX8x4zPc6Rm7Dc4ta
 PWfw4JfdWnB1nw87lD5AZJSiv1l7ufWhTB7rZYk+AutW3Fq6Agz7A3yXevYgZleVwye8cIQtwZ2
 lBTntlDIKAerJ3bEOFVWTXprWnijCjiWyj+opG3iB/Z0mpcoA9Y2ZxejIRgP1rvC5K85UzSIldm
 tR784qlNmRVgKRHNA17hjQxtjXECyK3JX3Y0cyTRrS5RRhgXMGv0880yuY5GzFIHRNe0YMGfHhP
 9cBwTsdvNheiZAsEwged3CayK97tg9RRJ7dFdPYuYGAG9Oaov58P+Mq5LCZ0zEafV9NUs8JIQlz
 xpxv/IRToIgeABqxarw==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6accdee3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VSReoY4tmV1E6dsv7MgA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX0yKP4iwdgiMr
 fBrA7YJEclL7F52Q9UPUG1d8gKFCaJtxpnnIXgbMeWH7WnXdPQq2s1lzrFyEO5BE5xHyKXfl940
 6haTPJmwK0GZRg0Biu7FEyv1z1EUuLk=
X-Proofpoint-ORIG-GUID: G1sU6oZdFnh-JF4ESXZXb98hzMIL_V_D
X-Proofpoint-GUID: G1sU6oZdFnh-JF4ESXZXb98hzMIL_V_D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053

On Sun, Oct 11, 2026 at 02:36:58PM +0800, Shawn Guo wrote:
> On Fri, Oct 09, 2026 at 02:36:34AM +0530, Akhil P Oommen wrote:
> > Nord is the first Snapdragon chipset with 2 integrated GPUs. It has
> > an Adreno 753 GPU which is very similar to the existing A750 (SM8650
> > chipset) and an Adreno A735 which is similar to the Adreno X1-45 GPU.
> > This series adds support for the A753 GPU. A735 support will come later
> > in a separate series.
> > 
> > The driver and dt-bindings patches are for Rob Clark and the devicetree
> > bits are for Bjorn to pick up.
> > 
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> > Aastha Pandey (1):
> >       arm64: dts: qcom: nord: Add GPU cooling
> > 
> > Shivam Rawat (4):
> >       drm/msm/a6xx: Add Adreno 753 support
> >       dt-bindings: display/msm: Document Adreno 753 GPU/GMU
> >       arm64: dts: qcom: nord: Add Adreno 753 GPU and GMU nodes
> >       arm64: dts: qcom: nord-rrd: Enable Adreno 753 GPU
> 
> I tested it on RRD board (against next-20261009). While kmscube seems
> running fine, I saw the following errors.
> 
> root@qcom-armv8a:~# kmscube
> [   30.192468] adreno 3d00000.gpu: [drm:adreno_zap_shader_load [msm]] *ERROR* Unable to authorize the image
> [   30.192503] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu [msm]] *ERROR* gpu hw init failed: -22
> [   30.202644] platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0

Turns out to be an issue on hypervisor. With an updated hypvm.mbn, the
issue is gone.

Shawn
