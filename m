Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332473803CC
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 04:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788754388; cv=none; b=p1vrFjogEuaqytsOyxj1MPFfD6G7a1JRz4Q0RG1WWA/KmXPfNRdxiuky2dx5oLUXqxRTMqewb6RprwglMgCqpaIsidn+gWlnkbihCyp6cmlYFO45Y5GP9rJ4ynQE+JSIJuImvhhmY839UvZFCg+Mz8YiiCbxMekfBQibaFK+AXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788754388; c=relaxed/simple;
	bh=L3M4rtvc3A0eRf+0aPCA5opGsYbyXqlehT5TgFW1/W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brJahFV4go1+PTHLtmBJYB4czwKLCKuG4uf+f5Q7694Vzjpk3GqgC0fClClkAXeWvRXB+gkkFzMp52z8TM0Zg/IgBPwBlg9Hwmllc/0sLLetkZ/MO9DxI5Jaa1TP1mpS/5I4tbDst6/Pp9r1gEqPl4jFIAWgpnIikr6Tb5DVlLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bsHJKGl3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EPQTppv+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bsHJKGl3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EPQTppv+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873lJt82391169
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 04:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=22U0nA4uBRDIsUT6kuK31Aj8
	XdWWpRxfWwREwxpHug4=; b=bsHJKGl3/JhFmZ9rswmII6z2tPN3F3HbElcCh39R
	Pbpq2XoO0eueR6GYh2s6ytMPl+SXmnhZcS2mejyjr8AHDTiE3DRKOdrYcs8RFecB
	whilhutlPHlhxlkcLroSeY7vpb7dJBI3oPEdLf51jSkBhtBrN0rNeOmqrvs+PVAV
	GvG4RHUJcyMmkTLHTbHIG4T2OuLLM6BQQwU10Sb6A+vBrLtN6R3bbUdF+4JlPIyn
	4haSS6/bIaqz7cVQvJA0tomu/xRCWxSM7PyAJIQuUw4hQ8PTyz7jXlrGF1JgQCUV
	/MGMAM+l4b103HSX/c6Nf1ELS1y1NtgQERI3+gtZ0LZUdg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuemysd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 04:13:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396638f9a18so1175935a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 21:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788754386; x=1789359186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=22U0nA4uBRDIsUT6kuK31Aj8XdWWpRxfWwREwxpHug4=;
        b=EPQTppv+kDyfe6OIz22Sa2czyiDsOdEEMF6KZumAAoAL0Ht3sWQXGXHA6JxYTvr3SL
         8lWPZgr6e3gNB31nCAdVruxSrTO01QyB1AvjimTAxs1/vJxGGEr5vpi+f4m8RvSCQQOr
         u+M4X1oz0ClRH+2hEaTbMKkBn8ro176sdn2+sLfeBC0FTuU6lnh47fgzTf+wvskzqQtL
         VicFC0eM4L2V09cxcEaGYylZP536IMG7Y/edKMwgPO2HrQRsV8R/2vZfiJzsroZKMjaQ
         FtNeHlL9Lu5K5XVdfCVoZsSgE72eNWr9pJIgR4/67CsQQmOP2WaLgdDr99bv3RxZMLQ9
         I/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788754386; x=1789359186;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=22U0nA4uBRDIsUT6kuK31Aj8XdWWpRxfWwREwxpHug4=;
        b=X5GcNI1MwapAtbD6yU0m1Bvl0mIr3F9dqVVKXT/M6ceaEcs4c/1fIxkGZsr7obeq+v
         rPmKsDhcoOI96fzPcCsfU7zhs+ekr1y6H+mzXT9g+6dXHKO3bRqbVTfanX2VAEGs4bXW
         zmWRX3Pz9cOqeXdGf2zcsEaAXDgp3+Q6CiNKgmtk1usyQVD3ljfjlhC0Pk8JmiDXZvn6
         1wUHepzZOXyMawocHBqGDEPzpPiwzF0GyDFwBdD4VPhB9UHzracOcHi85PozoFjZUttn
         Mh+cW23/sd7hLmr15vCi6F/n+LaeW4+6IpwRy/KNyhz7kfIlwrgn+0l0Zw+7TcHtPijP
         P+7g==
X-Gm-Message-State: AFuF++nZ7c2RRc3H66sqSUcQHsCj57tnGFiEvr+XA6QPtaEqIBc4SKXe
	uukhUGpUfP+4OwVxIQolwkrepFJKv8xLrYjOR87HmmeO3s3tM0ePhmveaJJybE/iCJGu803HH6v
	1TKFbENxGnYZMnN31UdH7rsnYr7ewc+ubH6wXrohKUavo/JkT8tLonHFdKGVvU1XEb22c
X-Gm-Gg: AYBFou0wEJ5p2oAPbbPBlM26Wz5WuDIQOPOF2Vg04U6uR5LAFjX5ctANw1FIKsrApc8
	gyNXHUA4REzK33m7IApj0fM0vR1cEwp0zi9ZobHe7hSYnKYBYkTDixjGThuA4zThwdG30dtxySn
	LXyOa2CA0AzKZClii6jnva9hVi/iL+fGAA5TNO+hs8ir91Imh/6PjW1XMCVhxP3YlyATcnFY/cr
	06PyNKuSiv0JGxBJt2vPfLAwA4NYeJaqlBImMeS6W6Znk52EXq3T8Kd3tIpKn2j24daw//PEb6U
	NQvzxAQUCQLr8bFefkqURcuNf59ozV+hBdF0XfC8DaOQ2lOF90ZYmbEPJHrTM+5qTV9Wlg7LmK+
	PPRdcgudEuQusqQnm570hABU2JiD/3xIfCKb2SJY1+BECLygW+yY8sMcIds4fIwTo0lyrAQRyMD
	+1FpACKH3CFSp3Oo484ovuPnVlqctt/Q==
X-Received: by 2002:a17:90a:d644:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-39b26245cfcmr32327155a91.20.1788754385551;
        Sun, 06 Sep 2026 21:13:05 -0700 (PDT)
X-Received: by 2002:a17:90a:d644:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-39b26245cfcmr32327108a91.20.1788754385032;
        Sun, 06 Sep 2026 21:13:05 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm15766714c88.8.2026.09.06.21.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:13:04 -0700 (PDT)
Date: Mon, 7 Sep 2026 09:42:58 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for IPQ9650 USB controller
Message-ID: <ap45yiuO2cgnRQFh@hu-varada-blr.qualcomm.com>
References: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA0MSBTYWx0ZWRfX6MiOuioB/g0z
 Q+At9n2hyuZ6JoDhsYNKSv8WHnHnvJe3TPvHQPJtbFSMlzRB+djd9iDnQZGSKz8Z1fp24oyM97n
 gpvGbZIqu8kjKkvf8aAuB6xHUI00Xe2pos5ddI1bIdr5rrddkmf5eZmHgNfe56rn21Xi0aneuPl
 wQRp2V8/44F2yGqgyLl5lfDgjBnhD9o42dzUxAMj7TyLY3biM4KcpigrPjd55O59ZGnJ4/M24N0
 lf/5IrDcSeNDaSJDaiMfcLuxs4v1ZNyb7Ca4A12xBILX8qwFjSau9e3cdMn7qE4U1V63QLSxNNt
 3SDManzswUxgCo1mw7HIrx6EtDdQ2b5ElB8BeW7xrNUGSvQ3ZOB2AGtpiImhWzVm683hM5Bla01
 YAvp254AjByF+TX/uAHaFzFOM5/vZDw+w56jh+rcEJksS24hDnAmHvkLnSCRlXm143GcaeisTDA
 0pFVg9NGoZO8YeSj/XA==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9e39d2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=BlFRT9tzNkAzCq5auagA:9
 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: YN2TGxMKfiqeNDyvyXRYojCgQP-s6wlQ
X-Proofpoint-ORIG-GUID: YN2TGxMKfiqeNDyvyXRYojCgQP-s6wlQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA0MSBTYWx0ZWRfX/aN3xX2bvDwk
 BTyMlPDQg1G4TIE8jNf9UWwZ+38LkOCwlqG6l9NQhIjXLBV3KqGn7fZSURlzC8tAlqk/aZWzISl
 VHCNYwiMUF3MqGFqd0/aDpcGc/9dugw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070041

On Tue, Aug 25, 2026 at 10:38:31AM +0530, Varadarajan Narayanan wrote:
> Add bindings and dwc3-qcom glue driver changes for adding support to the
> two USB controllers present in IPQ9650.
>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> Varadarajan Narayanan (2):
>       dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650 compatible
>       usb: dwc3: qcom: Allow the glue layer to pass ref_clk to the core

Abandoning this and will use [1].

Thanks
Varada

1 - https://lore.kernel.org/linux-arm-msm/20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com/
