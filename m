Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2724AA006
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050877; cv=none; b=dULs726tBMhyxkC4CRf4lYWqBncxFQjBEGqfk0A34587wYKGHFBa7l8SWwh/gTLW3dJO3iotMDdhajRspy28b/TD5AV9wUDjfaErlvHhm2mbhIP3DKsIv5jKdaeTlvXv8aq9VMyViZ7Qpy6S0p2jXPUiE0gKk0RCV+uQW6iHOxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050877; c=relaxed/simple;
	bh=hVteIZnn/KZGhwyV6npF3HFMEF8PGQ8W2HWu0o+zPKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+Y1TcOX5lmuWbYMT2tnvr+OofvvfmFgs32X6a1nP6x10If54nl8O2ebmIMx7HXCGagBdxzuifEpWbuuDEuq3OFWs20VoLLWJDgyw93vItMvhZqrnHuc7ZQ0cVRuokQOQqc2+QK0Y1DgRAd0to7fqK21B5/U+cZhcgcp1g82Tus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BUOJCsjs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Px6kr8sV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BUOJCsjs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Px6kr8sV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6xPVU2121306
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1dJSG07GXyGKGiQW7TmuVDezgqv6wfOW05ypU5gMGE0=; b=BUOJCsjsIAqYjHJI
	AF3wypISTszN5hD+N7W+fcozerWK14lPAXXETxlWb11U5SEVyHO/pcaU2dDcBtfb
	L//nsOQN1X4j1tSgtPbLKcSMbS1eg1p6CmFKJ9BgZ8SgrbHrqEGovvgNS0GszWZW
	K/jrfOmXFu0hg6JvTfXD64s5h9xg7X6BNtG346VVjeHhYMIrUJEsoP0JwsITp6xi
	9tha3OXTg8lKiWDA/TM4hikFaMe2MZKqZ/F4uPgLGVnMRmgtG/JoPRpCQ1uIY+IS
	hIKCshKsh179sXkZwBMGuPNbFnNziTtXIEWzd+R+CkWS9PncY10GOsjoq/BMKATA
	bkP3BA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn1jch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:54:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e93f67358eso15504155ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 00:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792050872; x=1792655672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1dJSG07GXyGKGiQW7TmuVDezgqv6wfOW05ypU5gMGE0=;
        b=Px6kr8sV6z102UhliOUl1fkIIc3wG4qP3hgJ6F1jlXuAmTidRVyHCDFNdgVX7jXp3R
         zpwXHLHpI7dueHMxIS89d2DM0BunsrrVgN+6oGFydby0wcUGxy0k+JlVnZWEZsub46KA
         FufB/pzHmNKnQ+MUTgSU9598rS8yY+Q54IRvw2U91U4mku0Oy7SEBABjkisYndGsxOGt
         GcJ/Qfm1zI+QszJng9ndGhSPcslj15u6vS8VL3pJRgwa7po4eiixcuvI5+ip7+bMoSW7
         dYN9epv7O4n6nh2qXUSeViEsSwL50Wn40EkFRHGrDKvVFEZtC9xJYclMmBT1sW2JnNK8
         PGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050872; x=1792655672;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1dJSG07GXyGKGiQW7TmuVDezgqv6wfOW05ypU5gMGE0=;
        b=aIfnhDvPRmK3waD+vhNGexaPgA//nE16Uf65YXZaY5CQGgImP4mVsoxtUv+/Uaaekg
         U34vBDyp3UAXc0xwgQbcTJsKhOBzxO/Nj2fP4bl1tMm5xLKVnQ+GuaUp76WypluKX17W
         nqa426hIlpzrgRuC6lHw8DtFryvYZmO3c7PI0v87ygDEv8v5mlco9I3cgsSBLkFfz4Cl
         zDjRwKjDJaaBaxKzGb/ZjNHWpVBSSfaZGVncrFan6GsBWgIGJrpAM4cUVLsUxctZafMK
         T1BR9nRqukP9hiNA38ZiRWP6rOTedqJwG9ecjeJVMinOHyzu6xOHOnjEUlRtFJzXKVBb
         b/RA==
X-Forwarded-Encrypted: i=1; AKwUvBxWbYh8pycHXzWjXrHOE6CmveWYpXvv3odZvu147bhZ9x70tpgrvCfJ8pl01pqMu+6s740WqVx/z41cNRJl@vger.kernel.org
X-Gm-Message-State: AFq9FYJElG23wojfk8RuF78FUuzHR0QjdBrQJ2abvcC1S46ZhoNozTL5
	awPvC48T75vz60NEQmaYVALQyK5CcNhMH+X/0cPrpkhu6i2O1lsCd032A1Dk5B71McVc+Cx8qBn
	0KkgoEsdvpMvoWjb3VgB/5nWIiP2G6Hv++WxGLGdcEFxnuhr6+uEN1LwC64knV0mE0kF9
X-Gm-Gg: AYBFou0ECUZzL0Hmyf1ZpoEcKqI0S5CZi7eY0PJT5SHyyNUwf1bUf+P+rTVtFkIDpdY
	TnaxYtuyprvvgIwVtcmMX/vlruqP3NWhOwNTMplRYG+N2Pj9daGHrtnkLevA7EfU1Yr4OEcBxik
	FVM2fhT1XmP2SBtmpGecWW0oqd3Z1lstZZY8Y2tDULQK79V07ALeXSrwrC0C6sWYDYGa971VRRU
	89sKg+dDY704yUklr02+jgNj1jFPKAwFTXR4QD2Tu3e5Te7uHuw9SZtitHR9TOX8iT6Qzvdxoj5
	BH3JmiNfWcbLNc8xXxIcDGQ2IFIhgJPOs3XJ9KmYgEacWd/Zf8mD8XR9+E8XFZK3iBmTSUVzUoN
	8D4nCr2gDZKHSyWxow73DUP4IMnz6hcU3ecYC8AMRTpakO6+HZ5106lhMwRq0sdK4OkmPSNJC
X-Received: by 2002:a17:903:110e:b0:2e9:2a1a:8b69 with SMTP id d9443c01a7336-2e92a1a8ba7mr57665905ad.55.1792050871822;
        Thu, 15 Oct 2026 00:54:31 -0700 (PDT)
X-Received: by 2002:a17:903:110e:b0:2e9:2a1a:8b69 with SMTP id d9443c01a7336-2e92a1a8ba7mr57665605ad.55.1792050871349;
        Thu, 15 Oct 2026 00:54:31 -0700 (PDT)
Received: from [10.133.33.32] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm76306455ad.54.2026.10.15.00.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:54:30 -0700 (PDT)
Message-ID: <56832d7b-e7a1-49c6-8995-4b17a442e4e6@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:54:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
To: Jason Gunthorpe <jgg@ziepe.ca>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, alex@shazbot.org,
        bhelgaas@google.com, jjohnson@kernel.org, johannes@sipsolutions.net,
        mani@kernel.org, yishaih@nvidia.com, skolothumtho@nvidia.com,
        kevin.tian@intel.com, linux-pci@vger.kernel.org, kvm@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
References: <20261011074514.515894-1-jtornosm@redhat.com>
 <b1a3f755-19e3-407e-b8f8-b494de83f59a@oss.qualcomm.com>
 <20261012144835.GG14213@ziepe.ca>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261012144835.GG14213@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX2QOKLX8oP0Qg
 aMCBqFgESnjIr35ldJc93E5yK3lW8vqHXeWokZDNYBNGYpeIK6kHefTjknW4Of/dVG0xpe+UEz+
 j4DE3iaHr0XFhCcV8o+zk3WDI39u9wCI34kURSORGa8h9Vu6272+XcrjRHFwaT9wP40qvPlPfz8
 JmtRKcJXRvJbweRMaVyz+AarbyReIehkSKOYlrL1qJTXD9ETjJNdfyBtYKf1P6mQQfmMpSIEW01
 0OjaQ4pJAzNYT4rEMrwYzJpMOr8odm/6pPfh1fbGGCUjLFzUnASxRJqbxeJi9n7dkRhHALeogxS
 JjB+U/sOikW2EtoiUMwWqSLqMCiAZf4rYFxgGWDDYPLZUmBfGn17qlSNJhJHwYoTu2HEdYMOqCs
 XKKs8iPlFEtRwPrGPOMGU9XAhl2oeD9pf8PS+qtsyn09czC4vhXwZHENAbYcF/v74EctbUeaNYJ
 d+deT4clX6vJ5ytIxoA==
X-Proofpoint-GUID: ApFX0vsuz0ixN4j74clIr1qJwZB2pBsW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX4BcOGDe51r2H
 MGYWBjrvq4bMKkClSIp2j3rpAQ4Uen1iodIdRDBMgI3mSAIirM22w56bObHmPj4rfQcq6+VJF8F
 tvlrux/AdjaBDd7ridCRrwF+K30nguI=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad086b8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=n56IT1IzDtYYEsRGsiEA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ApFX0vsuz0ixN4j74clIr1qJwZB2pBsW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150031



On 10/12/2026 10:48 PM, Jason Gunthorpe wrote:
> On Sun, Oct 11, 2026 at 11:22:26AM -0700, Jeff Johnson wrote:
> 
>> Thank you for providing this level of detail in your cover letter. I've raised
>> this issue with the engineering team in the past, but I've once again raised
>> the issue with your in-depth analysis.
> 
> The main issue here is the driver can't use a normal MSI-X in the
> normal MSI-X table.

to be accurate, it is MSI :)

> 
> "private" MSI registers don't work for virtualization.
> 
> Jason

