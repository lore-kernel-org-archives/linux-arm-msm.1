Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51CD541457
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 15:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092388; cv=none; b=KDe4UxhOeP93C2zL4V02I5D9cCw6114rsCIX7dw8S4lkEbzNryHvDghT7uVqEkL150n1t44U+H9WewqA6A690STRuePbHI5k/VRo67QKRYiLZIGbeQfA8qtps+ezgajEPNmgt/SWMDHw3Ehrcrqz2Qwtcun9/dPz+IZrqtY9pi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092388; c=relaxed/simple;
	bh=+0cvY03uJx1y1P2D/+4vHDG5Zh8Iu7Oql+aQLHLkJjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rXNtcAblYHt0Aoyk2PMz6xAWk2ZSYKuhqnGKlcLK0js5Fr1/QnJfTdnFWLkQqrcfmmtagSkX7IrPqrSizPXvEcHxDQACuQhWmWDjSIZewvPMI/+lefGkcHuxlmbz2gb9Ukh7RH1M1sl/6U3a94Mir55jZbML51Q5P3uioswCVzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eghf+xvy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TSvlnhpZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eghf+xvy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TSvlnhpZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjMv63307545
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 15:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XE/iO7cZtAlOijfmvMM+VDRqjHxwnf6dpW+xiR5DDVg=; b=eghf+xvy//ZOFslf
	UpveaGSVcYErvpNTp5T2vvsCG2NizpveWEYt4+MVh1sZFUIW2iXMDf2koLfzGvxw
	Fpm69AfvdrlllS+wklhM0clBw+kQXpvQfbFtAvmsRVD1aNFxJWJ9qVWsxQyRtgSF
	BXGKQlyBgfpBKL+27SAXmqIVl8sfhVa61k0bcIwLQUIdY1BfPxh68UiWB3ECDcvo
	F0ilmftXrHMrJtzTwfS8kH2Gl7yavjz7AEzq2JZ7+zalAxWcEIekePOf6j9vx4Wq
	ikbaCulpsDs8oJ4QUgeWcwrNt7hFwyzK9Q8/Byr8KrL1EiYErSIv2+l2I0RY9ySQ
	WWcGMQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj112yj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 15:53:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d001671a54so78733315ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 08:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092385; x=1790697185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XE/iO7cZtAlOijfmvMM+VDRqjHxwnf6dpW+xiR5DDVg=;
        b=TSvlnhpZNvpLiAmxSknwQ/S3c7/tpkLASCvGwb+0T+oglp5UtuTwJlG+giP3r/IBRE
         HoWgzCIfKRbjmfq4x9TxFV+VMmCssVJTKtVyLl9E3raVk5Tcb5BKxw00+ffkVv7NwHQL
         psK4B9c/7VwwuKwiL8G4Hl7lonCnNpa9ezpZ3hxVWYXCA0yWNy6l8GEULXfiNdTpwON3
         +biuKym72kirTIOM09E7HdJQeEAxgmQVJBqurRE1f4ER+oUEki6ZPF9sqVP9s/VAR8eM
         yk6vC5Si7vT2ODBcm+8cGxfN8BKTAzbHgVLx7+JbvZJVE/fr075t8YEavSPYmr2T3+R3
         OnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092385; x=1790697185;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XE/iO7cZtAlOijfmvMM+VDRqjHxwnf6dpW+xiR5DDVg=;
        b=Wh/pHWT7zmr1aOeakA9C1+oT7Iq8z2fA6P/moyWcsTkpCouIzwGRa9BuRSfxNZp8YC
         JCxm8Ls8rByQgKUbXUGRYR4s6JJU6w/OrQRoWXys6ZnhVy+bwfSjRKcv2+nqA1DB3Jb1
         BI97sTzAuE4FXnftsnYWbs/PkjycB5MTUHDOBs0gvFpSGYFemeyDoYouwoqIOA6Ea03h
         DMqOFtH1bzCU9KzRV4aq9DkLbQTyMPGzb2QKMKTUBLoCof4EhndxGDH05uZgfEHpA69/
         6kaFCqyusviZiuw9LJ6LBLG0xZQhCfZthlp38J9Tv4gAvEd/ME4KVDg8p0JWlLNaptX9
         4zIA==
X-Gm-Message-State: AFuF++mOHHgBqxZNlgjZCP4q4dV2toA8SWA7vciAHxlsgkLG9aIWiYxZ
	b+7/Fi6CKTzteVtyoSadTV1E8qfSqykq+P54zVW3ywhEXlhStJbIA509K4UsdEqfdjWFowK/CP0
	YctZ/a4C/BhUudj/qTTCjO02M0ccOUlgIoAyKVekvp7RbzOwa5CWQfh3gR3mDaMcLeBIx
X-Gm-Gg: AYBFou3/rRHJjaWc5CMMneLpZ23OAxxV8OeDyBekRCKopm/IfKXRsy6dxe6it5oWJ8T
	1qJQ+goWPGjjkkJUsPGX5feiZociWxD7WNhZxLw8YsSV1Q27bCDsM+gO1R+pJbNRUh+1wIR5W6b
	l35VKDZPvOd9VkJ7JpztfYl5FMzplyJTH/X6iClKwIF9vGJIjyrYSm5gdLnXavTfbowxQLzdV8Y
	S2rZgU50k7NtX82yMGYyPhtDRwYheQkw+wru3Lrz/rKBF2ODJUu1gVLeDVBLzRqCeDH+kwsMdTE
	akxXsRmRnhDXMo7yEDB8KupFXSVJ5BGO4tEzC1laHT+pzsIvZ9eSxdMI/T0uCI15TpCVBh0RTDe
	0VTh1o6qIQMKvNlHPJpl3nH31dlni
X-Received: by 2002:a17:902:ce8a:b0:2df:3b08:a30d with SMTP id d9443c01a7336-2df60b60b5bmr20251405ad.43.1790092384954;
        Tue, 22 Sep 2026 08:53:04 -0700 (PDT)
X-Received: by 2002:a17:902:ce8a:b0:2df:3b08:a30d with SMTP id d9443c01a7336-2df60b60b5bmr20250935ad.43.1790092384329;
        Tue, 22 Sep 2026 08:53:04 -0700 (PDT)
Received: from [192.168.29.33] ([49.37.212.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d02f7e1sm13009205ad.39.2026.09.22.08.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:53:03 -0700 (PDT)
Message-ID: <f8f231b6-a4fb-4f19-9ec2-949668bfd5b7@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 21:22:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] wifi: ath12k: Connect to the QMI server belonging
 to the device owned by this driver
To: manivannan.sadhasivam@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-4-c00831e88957@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
In-Reply-To: <20260922-qrtr-multi-ep-v3-4-c00831e88957@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8xpn1cijIGwGdeZ6puWqkF9wRq3XA27-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX3OArXalOMvSn
 aOFIhqGbhWe9nnqHzYyrzBxXuOWzEm7+xwLsB81ocC6r4wFfDYRjM3VUVUAcCDRk9jMSXVAUKPP
 J8He8dNV5nFyl2Jttd1zTUC15jTMYuc=
X-Proofpoint-ORIG-GUID: 8xpn1cijIGwGdeZ6puWqkF9wRq3XA27-
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab2a461 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fVbWt6ZMyMsyUNhTwytWAg==:17
 a=bQg6oyjaoxrshYPP:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=R4z_reooDQMcG2LTbH8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX9rsC5aAFCkF5
 ghyDqBFNyAzNuLJAy9NOiOzg1qFCgaTRItNfpg6VeMMdSgdS+9TUfPQPbG8mDaJH9Ym32JFIWzv
 TbKPQ9gE1KhVuUbSEer6avBQCkDQa1LmqIf3oQRxksHQBx+DWeQBRoLXBqn2mho9VuyXNDhulYB
 txVDuC/OoU3D+mp1lipEvujgbELDpAD56KncMSdAiLA6vAe/VlwJ2LunhgudGEI46ZQnSPnXwiE
 eL0uKyEkRPyWwvrns2HNzUgGhia5rgCQh7Zhhbe4PPilYzS46yUwDgSG4iZ96ECM9f2KtIqxhN0
 NOzpWltu8h1IbN8270W8PKAZh1e9dn8NloYaNBja4IeDJoTaHsuIicQ+CxCPdl0Re+A/dbkWOwX
 HcHV65UdlchVmq07+qNgeoFEkg7WrlpfSkSb3XEo55HWHaiFPZvEsNa9qxUZE7bkxJx+QSCdIPs
 bpO+o2LZu+juOJ0HpcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1011 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231

On 22-09-2026 19:11, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam<manivannan.sadhasivam@oss.qualcomm.com>
> 
> When two identical ath12k PCIe devices are connected to the same host, both
> advertise the WLFW service with the same service and instance id. The QMI
> lookup reports both servers to each device, so a device may connect to the
> firmware running on the other device.
> 
> But now, QRTR provides each MHI endpoint a unique node id which is
> different from the node id announced by the device. So use the same id to
> pick the correct server. Add a get_qrtr_node_id() HIF callback that returns
> the node id derived from the MHI controller index and zero for transports
> that do not assign one. In the new_server callback, skip any service whose
> node id does not match. A node id of zero disables the check, so transports
> that do not assign one keep their current behavior.
> 
> Tested-on: 2x WCN7850 hw2.0 WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> Tested-on: 1x WCN6855 ath11k + 1x WCN7850 ath12k
> 
> Tested-by: Juha-Matti Tilli<juha-matti.tilli@iki.fi>
> Reviewed-by: Vasanthakumar Thiagarajan<vasanthakumar.thiagarajan@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam<manivannan.sadhasivam@oss.qualcomm.com>

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>

Validated in ipq9574-rdp433 with three QCN9274 PCIe devices.
