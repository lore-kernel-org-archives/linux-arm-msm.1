Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276973DAAB7
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785136285; cv=none; b=p6I0s+tNbJVDLoQ/tJ1ngcG4pOz49w0b9hPRFpVSdv2FGaBuAKlp93DFecLbUJ3NddpBeRj0qoZmajXRuA5qhPG3+HCOlQFOcwMzYLJAhTdEPHJ2sqLVSYWSHVcv0tWn2VO3+/P2LqQsz2XAMLrUVKsRiIqTfpzUJXK8jOeRzkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785136285; c=relaxed/simple;
	bh=cQG7yexUIlc/P/Vm7qq0IEXu1A/Mjlf0F1X92+0PAmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MKv6Jx2c6G5Qc9Mdisk6ptyMbb442oMnyakXICpW58ibJ5nCOEyi07MEloeKBZ4dVVblwSXdlDjmd30CQmoIbPpQTPVqR20kvsXuDDynPadUw+W4CqKvPTnHqz3qKxI5HyGcFDdXwrYXL+jX67KjmoWwhd/B4HxXKooKiiXLe60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C8+DrRnG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E5sKMtaO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C8+DrRnG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E5sKMtaO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fqCR2137825
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k3oM15ZU9/jgvdiJaBQrR+abgAJOvrmHsCDR1Cet4HU=; b=C8+DrRnGVNfA2Ju2
	n3IgSBvmF9jBMd7wjukp+A9w7tj7KoeL8YsaQSWRIRFsjh75PcEnIMnYBHZezmEn
	cLtkJK/DmVPjtJqPLH7MwxCfz6PuZzM+phXu0xPG/Vxd2KRG+ochBjOq+WnstPPs
	fPTP6USBZYjBJJPvDCp04TbRiRiA7jJttMHqskzdPtQxKu2r+Led8doZ+UxDYSxV
	YtqkA+LvQtxNNESuFtL3Om9j7c+DOmfHelzuYVOs1AzxdRP0AgmBI9pm+qbc+SLr
	/kakGjhu1eqt1Jli9bzNL3xJANqr5zPVmu0BVTiN3vuIniHklcVAm6cka418LOZd
	a9jrzA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnh7vxs6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:11:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8486ffba174so4009269b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 00:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785136279; x=1785741079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k3oM15ZU9/jgvdiJaBQrR+abgAJOvrmHsCDR1Cet4HU=;
        b=E5sKMtaOk/05i3O46Zzej97eG8xZFLQ1/IoDtygxoUrTW4o2gg34yvtyyG+BLlvn5e
         Puf4/MVStSn+kh9kdqxdwtoUmXGODot1qPXUu3N2Et2zYENW3Pa9+dehy827EMHkO9ID
         iYBhTqrsTRqC90f0vwqXkFLdJ1CAWbHNeO2DZ18VUUu/e+eAtJ0g10KNn5f+ya5IEgu3
         DR8xAWMDd2rHyAFqIdvCitndRNtzYElQordmF+2P4wGjTIHCrZ1Wf4yvUw7MaIQl2R6l
         4iOnoMeHDZds1gmJHncMH49Tbxfo1l6V3fBF4gpyAD/QYjmRxppvizciWWRr4fZOq6pz
         zabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785136279; x=1785741079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k3oM15ZU9/jgvdiJaBQrR+abgAJOvrmHsCDR1Cet4HU=;
        b=eCM7IFU/oHL90WLiH/Ze4qIT4OULDH9yG0GhvZ3tAgJNU3X6lrhYAkuPO3JHBIA6kY
         XCjd66GNr/mHf5aaUbkjCrxQBwgqHdQM3TFiJAicrQy3+QkCkf2714zBGUwZk8Mz0Gsl
         aOxyLDYUUojj2ln3nyxOvNwS0fh7T1QiJ3iUxh+kevATaeTodQtna9SYYk6O6y/ZWa7K
         6l4OJQ027k4ssUiAwfJJoFjsUBQn4WO435KMCNaZEPHFM4J9U9/9rG4+3whC7vOiXsXR
         veTAlIkI0V/oB8d6APZKl0JlrI0Atc6pcONal10RodqBfSCml9cpNdo6I1phQw4pOPaz
         cdqA==
X-Forwarded-Encrypted: i=1; AHgh+RqhSTOjM5EXWisO0NQvhlk4N++izFeyXAOmntHsMx6WGBwT6RRVVhLumWcEISktLSaMVXtDFWcvAkZ9zhnt@vger.kernel.org
X-Gm-Message-State: AOJu0YyQG/xKk9MCyKVAJKKosymAw7XTPjJl22tHY52zugKqT54hucnp
	mf528IW+eNKFIqOjFUtOalwCDvE3v0AQJPlxdB8cxvzl5u/TtsCJPTxIWq2Yr7v1Bjq9x30P7yp
	Myo/kuCtKS/BgX1yJ1JQ9BfjxTGAfXfcHmha636oOyux/N6DnZWa12VXbmBs3LQLBFtFK
X-Gm-Gg: AR+sD11TMylSa1iPx77EwMHaJj1du5HEciE9mjcIR+DenFBY9bELsc8WvxR8+10LSLs
	7f0r281JkihK+EVNLgypnifOLrPsS9xBx8kbfJ4QnrmIU70QuhXSAaPC8rs/zhEo5SRzIQxXgZ+
	5HUGXcjDkmrdqgA7bN7bcbU6l3xtMcfo9pCtJ61V3jy22eY2E+PBZbHVt+RJs7jxO0nAwB5TiNd
	BfyCoW8S1eoAg1lT/43igt2BrmemOV40gOOHUMOCaH3ydrMjqd8Avf/tEALB2OEFTh3abInV44h
	Fgy/sfTObjqZHFgw4zN48Mr1P1H3u8P9iyKhzyOiWyT9pEE1cpln8Afs3Pqe2uR1SEKFmWiJOTn
	nT5A6P7VEAATXc27LMrD7Nijh+AH0PA==
X-Received: by 2002:a05:6a00:2990:b0:848:590a:4c90 with SMTP id d2e1a72fcca58-84e595b702emr5828432b3a.59.1785136279297;
        Mon, 27 Jul 2026 00:11:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:2990:b0:848:590a:4c90 with SMTP id d2e1a72fcca58-84e595b702emr5828411b3a.59.1785136278810;
        Mon, 27 Jul 2026 00:11:18 -0700 (PDT)
Received: from [10.253.79.132] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1386sm2606568b3a.36.2026.07.27.00.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 00:11:18 -0700 (PDT)
Message-ID: <cbd7a34f-613b-4b8b-bc7b-9bc5a7ab391b@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 15:11:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] Bluetooth: MGMT: Fix discovery state race against
 cmd_sync worker
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
References: <20260710052009.728899-1-xiuzhuo.shang@oss.qualcomm.com>
Content-Language: en-US
From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
In-Reply-To: <20260710052009.728899-1-xiuzhuo.shang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cSzCbq4gAz-_k50dE283A6qDLo1kKWA8
X-Proofpoint-GUID: cSzCbq4gAz-_k50dE283A6qDLo1kKWA8
X-Authority-Analysis: v=2.4 cv=f/54wuyM c=1 sm=1 tr=0 ts=6a670498 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tknXimsZ09G-OvYSg0QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA2OSBTYWx0ZWRfX9giGK+owKq5h
 zKATY0uI5QzrXkKHW7WaHbd/Lc/mXHcBt+ofRVqGj/kdIJ28bqcYaro7cY4x/yum8jojw1z0yr+
 HWUSM/ImVBdkOlFaq2oPATzb5+CrefrTIVR4gnTKLOe1LvnTRJ6Fs7lNXO4239/Czhf6aEO6qLI
 CkbizWgaxqhCKtVJ8hKrxKzsama8JhHOp0Zv+vHrjy4M+b6oE4MkR0FpoGoCToNxnjiG0cqGnVB
 D1KH9DGaYXP6wATN9c+L4t62N7Tysvv4R3K5IUL+qxDb7qGiJUknP8xULXVMpF/gaFDLJyJovBj
 h0dxg6vlxnQ0AsHDDHp63Oxl9yaSXwHlURJ49bPK/GUEzl48zKhFxyuUucJ7k8bfUA3rlYuSQd/
 sLZHfTJziFwqpJHVF9QNdXot9pdSU725VZcB7e87Kt6IvbXzexKUXR1lcKCMx2V/iSj7kanO1Dg
 6LuepSdVxjkysNK2xBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA2OSBTYWx0ZWRfX0+FrdwXYHVTe
 oK6cLwti5cLqRGPRUXOou4Qo4xBVGc7d8y+Y1xeBJtUA6adnqOtmwrxpTN/J22Zy70RYw7ocy+Y
 QysZE6Y1SAyEiAU3X5QVykKqtSGGvWo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270069



On 7/10/2026 1:19 PM, Xiuzhuo Shang wrote:
> start_discovery_internal(), start_service_discovery() and stop_discovery()
> queue a cmd_sync work item and only then move the discovery state machine
> into its transient value (DISCOVERY_STARTING / DISCOVERY_STOPPING):
> 
>   err = hci_cmd_sync_queue(hdev, ..._sync, cmd, ..._complete);
>   if (err < 0) { ... }
>   hci_discovery_set_state(hdev, DISCOVERY_STARTING /* or STOPPING */);
> 
> The matching completion callbacks run on hdev->req_workqueue serialised
> by hci_req_sync_lock, which is independent of hdev->lock. So once the
> work has been queued, the worker can be scheduled, run the sync function
> and invoke the completion before the caller has executed the trailing
> hci_discovery_set_state(). The completion's success path writes the
> terminal state (DISCOVERY_STOPPED for stop, DISCOVERY_FINDING for start);
> the caller then overwrites it with the transient value, and the state
> machine is wedged: every subsequent Start (Service) Discovery is
> rejected by the DISCOVERY_STOPPED gate with MGMT_STATUS_BUSY (0x0a),
> with no HCI traffic generated, until bluetoothd or the adapter is
> restarted.
> 
> Fix it in two parts:
> 
>   1. In start_discovery_complete() and stop_discovery_complete(), wrap
>      the terminal hci_discovery_set_state() call with
>      hci_dev_lock() / hci_dev_unlock(). These callbacks run without
>      hdev->lock; the caller holds hdev->lock across hci_cmd_sync_queue()
>      and the trailing set_state(STARTING / STOPPING), so the callback's
>      hci_dev_lock() blocks until the caller has published the transient
>      state and released the lock. This serialises the state writes and
>      closes the race window without needing to reorder the set_state
>      call relative to hci_cmd_sync_queue().
> 
>   2. Generalise the "ignore -ECANCELED" early return in both completion
>      callbacks to "on any non-zero err, also reset the transient state
>      to STOPPED".
> 
>      For the stop path this also fixes a pre-existing wedge: when any
>      sub-command issued from hci_stop_discovery_sync() returns an
>      error, stop_discovery_complete() is invoked with err != 0. The
>      existing "if (!err) set_state(STOPPED)" tail then skips the reset
>      and the state machine sits in DISCOVERY_STOPPING forever.
> 
> Fixes: abfeea476c68 ("Bluetooth: hci_sync: Convert MGMT_OP_START_DISCOVERY")
> Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
> ---
> Changes in v4:
>  - Drop the "move set_state before hci_cmd_sync_queue" change (Part 1
>    in v1-v3): now that the completion callbacks acquire hci_dev_lock,
>    they block until the caller releases hdev->lock — which happens only
>    after set_state(STARTING/STOPPING) has been written. The lock
>    acquisition therefore serialises the state writes without reordering
>    the set_state call.
>  - Update commit message from "Fix it in three parts" to "two parts"
>    and revise Part 1 description to explain the locking argument.
>  - Link to v3:
>    https://lore.kernel.org/all/20260708093822.3495633-1-xiuzhuo.shang@oss.qualcomm.com/
> 
> Changes in v3:
>  - Replace inline patch title with lore.kernel.org URL in v2 link
>    reference to fix GitLint B1 line-length check.
>  - Link to v2:
>    https://lore.kernel.org/all/20260708062009.3047447-1-xiuzhuo.shang@oss.qualcomm.com/
> 
> Changes in v2:
>  - Fix if (err < 0) to if (err) in both start_discovery_complete() and
>    stop_discovery_complete() to also catch positive HCI status codes,
>    flagged by Sashiko.
>  - Add Fixes: tag for commit abfeea476c68 as requested.
>  - Update commit message wording from "err < 0" to "non-zero err" to
>    match the code change.
>  - Link to v1:
>    https://lore.kernel.org/all/20260707093426.372897-1-xiuzhuo.shang@oss.qualcomm.com/
> 
>  net/bluetooth/mgmt.c | 58 +++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 52 insertions(+), 6 deletions(-)
> 
> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> index 733a4b70e10c..2295042234f8 100644
> --- a/net/bluetooth/mgmt.c
> +++ b/net/bluetooth/mgmt.c
> @@ -5975,15 +5975,38 @@ static void start_discovery_complete(struct hci_dev *hdev, void *data, int err)
>  
>  	bt_dev_dbg(hdev, "err %d", err);
>  
> -	if (err == -ECANCELED || !mgmt_pending_valid(hdev, cmd))
> +	if (err) {
> +		/* The queued start-discovery work failed before the normal
> +		 * completion path could advance the state machine. The
> +		 * caller already moved the state to DISCOVERY_STARTING
> +		 * (under hdev->lock; the callback's hci_dev_lock() blocked
> +		 * until the caller wrote the transient state and released
> +		 * the lock). Reset it here so the gate in
> +		 * start_discovery_internal()/start_service_discovery()
> +		 * does not wedge in STARTING and reject every future Start
> +		 * (Service) Discovery with MGMT_STATUS_BUSY.
> +		 */
> +		hci_dev_lock(hdev);
> +		if (hdev->discovery.state == DISCOVERY_STARTING)
> +			hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
> +		hci_dev_unlock(hdev);
> +
> +		if (err == -ECANCELED)
> +			return;
> +	}
> +
> +	if (!mgmt_pending_valid(hdev, cmd))
>  		return;
>  
>  	mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt_status(err),
>  			  cmd->param, 1);
>  	mgmt_pending_free(cmd);
>  
> -	hci_discovery_set_state(hdev, err ? DISCOVERY_STOPPED:
> +	/* Serialise discovery.state writes against any concurrent mgmt path
> +	 * holding hdev->lock; this callback runs on req_workqueue without it.
> +	 */
> +	hci_dev_lock(hdev);
> +	hci_discovery_set_state(hdev, err ? DISCOVERY_STOPPED :
>  				DISCOVERY_FINDING);
> +	hci_dev_unlock(hdev);
>  }
>  
>  static int start_discovery_sync(struct hci_dev *hdev, void *data)
> @@ -6196,17 +6219,40 @@ static void stop_discovery_complete(struct hci_dev *hdev, void *data, int err)
>  {
>  	struct mgmt_pending_cmd *cmd = data;
>  
> -	if (err == -ECANCELED || !mgmt_pending_valid(hdev, cmd))
> -		return;
> -
>  	bt_dev_dbg(hdev, "err %d", err);
>  
> +	if (err) {
> +		/* The queued stop-discovery work failed before the normal
> +		 * completion path could advance the state machine. The
> +		 * caller already moved the state to DISCOVERY_STOPPING
> +		 * (under hdev->lock; the callback's hci_dev_lock() blocked
> +		 * until the caller wrote the transient state and released
> +		 * the lock). Reset it here so the gate does not wedge in
> +		 * STOPPING.
> +		 */
> +		hci_dev_lock(hdev);
> +		if (hdev->discovery.state == DISCOVERY_STOPPING)
> +			hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
> +		hci_dev_unlock(hdev);
> +
> +		if (err == -ECANCELED)
> +			return;
> +	}
> +
> +	if (!mgmt_pending_valid(hdev, cmd))
> +		return;
> +
>  	mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt_status(err),
>  			  cmd->param, 1);
>  	mgmt_pending_free(cmd);
>  
> -	if (!err)
> +	if (!err) {
> +		/* Serialise discovery.state writes against any concurrent
> +		 * mgmt path holding hdev->lock; this callback runs on
> +		 * req_workqueue without it.
> +		 */
> +		hci_dev_lock(hdev);
>  		hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
> +		hci_dev_unlock(hdev);
> +	}
>  }
>  
Hi, Luiz, do you still have suggestions in this change? 
>  static int stop_discovery_sync(struct hci_dev *hdev, void *data)

