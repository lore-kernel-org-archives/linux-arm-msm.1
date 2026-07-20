Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D23830C632
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784539846; cv=none; b=e5NE9TCQM++UHCtsIAfuB7kt+Iq21Z7mRYm1KQi4hgWCEXSgjKK9+g+AzageEuNwc6Sy4moWBrkSMxzZ60zEU9I+e1eJbH9Kr0r9PYhlHSf5oSsLnct4PztqRJ4jWYJppkwo1PIT30fMXOYxrK1RFrBTw95PBxzGVsmUUD4VORM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784539846; c=relaxed/simple;
	bh=jM4UUMBRRP8uRpEJx0EfvPk59ZZg6+bdt8UCUfdTYp4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=nAtwco+pN7Q4LbrdU/NGtT0Tycu/YXGZq2mqXiCxhsSLHnPVW+Mp8oKssvG/zOJcd0UAq6U28pPzHVIGvAw7X6VjQV5IbHb2HC1YvJXgtht+OYrDpMmHoXHT4x1orQ7wIFh5trCj1BZG3N9ylDD8bIpABSn2B071N4vmCXpeKh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEQxrGW0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ezoqdS2W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEQxrGW0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ezoqdS2W"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RVZK1420176
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7RhaLu3FBbB0/I353UaDphTR2udvrhAv4YOYRhgtD3U=; b=FEQxrGW0DujiLdy9
	wmbkgIsxd7zWVYIt32Gv/3sQSB2hz1KZYUljsIUxwY7pVrTebPAODpV0g92QKzAx
	vnENLZL6cL6BGXmHGRt1dMA02gz1ZUnQrdDzPupamFMA1H1efW3GhVlHJRxGgQTy
	ssmfsRulCX5g2rvfZNAdKwQhfZrGCC/+DrD4s2KGMBEB4rnMiJXlMX4Lp7xN8HhM
	mVbYRvJ8r7A7voilAhUpLy0s1jn0MCJ7yOv/dB92Es8eypEYOLoYZuiO/oi3xCEl
	usMfVFbyVpUQzWqxCiXlDWo02/AAdmoYOlaqhYLkQuy+1zw4zqo4c9dq/T6udSN3
	xkDwkA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7wkf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:30:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51e9d892f0dso13388791cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 02:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784539843; x=1785144643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7RhaLu3FBbB0/I353UaDphTR2udvrhAv4YOYRhgtD3U=;
        b=ezoqdS2WZ4bMVT3eMcK95CzHO6a1DeaGVVbA4w30uJXCKiy+rgdTmb0C0vqCB6eul5
         UM2HYvGLnS0FmRj8WOxiTtIS7snCpeN9MfEf2ainEeu7ndl+kN3vRr8mvEQvWsGtpjaQ
         1miEaRO/z1Er2rpv7OKzAQPikh/VGNrtxRVK2TCsfq9iouzxz9CYqe9ma921MtOvxs5+
         OQumHBz2dYopVlzJ1WLCoBc64awfAlzYnwbyz1w6zPBHhpDtr5+AraRlwKmSOfRaDzlH
         glEzWemangmwt/uTjMGc4p3jtAQpNQI5JRheH/VPL+SvNkBPhKGpW+gpIWy0Vvro11w7
         h0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539843; x=1785144643;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RhaLu3FBbB0/I353UaDphTR2udvrhAv4YOYRhgtD3U=;
        b=GSc4+Yh1UbXpjexci9XG3kfZSugDryPyrpUQinRJHYFqakaGJ/2HTC+l2GeAZMZvFc
         Vn/4D6+RbLybNOi3o+r2pEn4Ufoe3ODrFrrWVTJ3kFovOA47cIEnsdU8r5qzo5Xi7L/W
         UuqAP93JqtOS66Z+/+0x/e92eqS+/U+SRNtZuStnKsTEfVLs9RGzs+CR00vqQmLz7/XH
         LoUs1viZ5WM5h39OLrB9HFZss5RphZ3qAyeTNSIkWvFCHgQsbbN3KUdRnJZQOsE+ZGr7
         o152CB8gar6vPxoVbL8F+xmOYtZxXUCQ0whs42OJelr2ZVTB9AhK3uEpsj/TPpBGjlXh
         VqTA==
X-Forwarded-Encrypted: i=1; AHgh+RoE9vQ4AW+m4ph2XuUEAtI91lmOCT0IfIyqae6BvJhJHHofrMEeSsF9u3tKH4Cl9H4Rbjkn3IIryDaK0faD@vger.kernel.org
X-Gm-Message-State: AOJu0YwORkWlhGl+14MibJbRzd84IKzYZVwJPdZbfkI0LsdKRs7dIeBa
	vahV0Dt69hq3Qx0OhJQoMoqKZ8GsAHtS96h0XFsXbz+lJj7vr/2W/yWNTk62E9ejLYRrVjcvxGb
	QPTf7gks53yCJH2IRsKx255PGKeSmBvV6FmRgPR5EhCvixS3F6T24V+yNrORIIa5Oig4W
X-Gm-Gg: AfdE7ckJq5m28CYzEYatUvTRzcRyWIBm38FKod7DM+/cZrtwFiPuiAlIUWNX/5R6Za0
	RosrpCBiQSCs6WXrnbNsjIxW72yK4zD7ekgqzrJqopKim1NmfzkjcSlSzwIb2kbtjF7uM8iYurh
	uJuGzCpMrCV4sDxohKlxdlhCe7p8fhehYaMBDPw9c7Oj+x0ceTM10639S8atS+HBQUb9qqXhb1O
	HjeMqMPR8dmEzprmZnJqFWi+ExkwF/YIqtrpZZPZbiX5GJwnFdYZaWmuVnzLTNF19TGkDszzPse
	vkpoOFZCQC9szY0tAzHQL+bPGpQ+SO/lnpzud8JzpYuLA+xCh6qBMS3sMyilFqcuaVCPmNJsRgo
	xPGGHKGNxpRVgf+GvFy/v0dAu
X-Received: by 2002:a05:622a:a948:10b0:51a:8079:795e with SMTP id d75a77b69052e-5213c7e739emr77199261cf.4.1784539843453;
        Mon, 20 Jul 2026 02:30:43 -0700 (PDT)
X-Received: by 2002:a05:622a:a948:10b0:51a:8079:795e with SMTP id d75a77b69052e-5213c7e739emr77199081cf.4.1784539842957;
        Mon, 20 Jul 2026 02:30:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1740bf638asm433035366b.59.2026.07.20.02.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 02:30:42 -0700 (PDT)
Message-ID: <a835f571-a95e-4b38-bdbe-88353b863125@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:30:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] of: property: Create devlink between PCI Host bridge
 and Root Port supplies
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        robh@kernel.org, saravanak@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        qiang.yu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <20260506075625.8490-1-manivannan.sadhasivam@oss.qualcomm.com>
 <fa5c5ed6-afd3-4e5d-80bb-921d6f96dfac@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fa5c5ed6-afd3-4e5d-80bb-921d6f96dfac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwNSBTYWx0ZWRfX4pr7WvdL4DAz
 wOWNG70rAgsovPM1rOq++zfCgYXZ/YgdNIumFuWapKpriLRgiyvfIlteRRqYeaVfbnhHPaDKVbF
 ULC5Q/st3w9UdBRnSOY8qdNwN/N0riakXVcplHQtWSflVerLEZVei+qGfVR/fwpu8pXZaNf0fTz
 E4NyCiRBbm3769td03Snd7cMOeF4bzDWhX8FXd8gGe6X6QapIwmxkR55lLMZOFwGXI13zwB5qyd
 GHwabMIqA/+K3iFJzJphhpkiEJ3gsFLO4bEUaGo088Clx9IPlrvaAFc8jLr8kzeDaiisy/Zn7ib
 XDX8LGXUTglH+qpKiU1QlslRX1/neaC/Bsxu59C2tViXUuQxdSgwf8nCyEQjl4ksuDefjd4wUTM
 re7dFKSe1YSrLPIZzQJlB4u6qaDfeTWuQSkedb2uEhoJyZgf7V73vyaFf+4O1MB48JRr7XlQjEo
 TxzV9XtmxGiDJ1cOpMA==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5deac4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Je0sRbJHxvWcALlGw_UA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: aKLrbWopDxWkFh_uPqGfQglTPVNTmPTo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwNSBTYWx0ZWRfX/0rJKlS6F3As
 U2mzSLO87w1TIm6DJ2tG64XWGxScPvCf3hYD2y9tLXWbemcQCOcYfKG6A0QL1qYULyLAGhKlPnM
 84OebV+EEwqHCEQ/L68THywW10b17fo=
X-Proofpoint-GUID: aKLrbWopDxWkFh_uPqGfQglTPVNTmPTo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200105

On 5/8/26 12:32 PM, Konrad Dybcio wrote:
> On 5/6/26 9:56 AM, Manivannan Sadhasivam wrote:
>> Recently, devicetree started to represent the PCI Host bridge supplies like
>> PHY in the Root Port nodes as seen in commit 38fcbfbd4207
>> ("dt-bindings: PCI: qcom: Move PHY & reset GPIO to Root Port node"). But
>> the Host bridge drivers still control the Root Port supplies as a part of
>> their controller initialization/deinitialization sequence.

[...]

>> +	/*
>> +	 * Since the host bridge drivers parse and control the Root Port
>> +	 * supplies, create a devlink between host bridge and Root Port
>> +	 * supplies. This will prevent the host bridge drivers from being
>> +	 * probed before the supplies become available.
>> +	 *
>> +	 * For checking the host bridge node, first ensure that it is a PCI node
>> +	 * and its parent is not a PCI node. Only host bridge nodes will have
>> +	 * this structure.
>> +	 */
>> +	if (of_node_is_type(con_np, "pci") && !of_node_is_type(con_np->parent, "pci")) {
>> +		for_each_available_child_of_node_scoped(con_np, child) {
>> +			if (of_node_is_type(child, "pci")) {
> 
> Doesn't this go a level too deep now? (a change vs v1)
> 
> for example, in x1e80100.dtsi:
> 
> con_np = &pcie3_port0
> con_np->parent = &pcie3
> 
> And I think the code now looks for device(such that device_type="pci")
> *under* &pcie3_port0

No, clearly I managed to misunderstand this.

Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # Glymur CRD
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
